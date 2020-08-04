import 'dart:collection';

import 'package:blood/models/add_donor_model.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<DonorListProvider> donorListProvider = StateNotifierProvider((_) => DonorListProvider());

class DonorListProvider extends StateNotifier<DonorListState> {
  DonorListProvider() : super(DonorListState(isLoading: true, donors: []));

  Future<void> obtainDb(String bloodGroup) async{
    state = state.copyWith(isLoading: true);
    final _donors = await obtainDataFrmDb(bloodGroup);
    state = state.copyWith(isLoading: false, donors: _donors);
  }
}

class DonorListState {
  final bool isLoading;
  final List<AddDonorModel> donors;

  DonorListState({
    this.isLoading,
    this.donors,
  });

  DonorListState copyWith({bool isLoading, List<AddDonorModel> donors}) => DonorListState(
        isLoading: isLoading ?? this.isLoading,
        donors: donors ?? this.donors,
      );

  @override
  String toString() => 'DonorListState(isLoading: $isLoading,donors: $donors)';
}

final Firestore _firestore = Firestore.instance;

Future<List<AddDonorModel>> obtainDataFrmDb(String bloodGroup) async {
  QuerySnapshot eventsQuery = await _firestore.collection("donors").where('donorBloodGroup', isEqualTo: bloodGroup).getDocuments();

  HashMap<String, AddDonorModel> eventsHashMap = new HashMap<String, AddDonorModel>();

  logThis('eventsQuery.documents ======>>>>> ' +eventsQuery.documents.length.toString());
  eventsQuery.documents.forEach((document) {

    eventsHashMap.putIfAbsent(
      document['id'],
      () => new AddDonorModel(
        donorName: document['donorName'],
        donorNumber: document['donorNumber'],
      ),
    );
  });
  logThis('The valu is thisss ======>>>>> ' + eventsHashMap.values.toList().length.toString());
  return eventsHashMap.values.toList();
}
