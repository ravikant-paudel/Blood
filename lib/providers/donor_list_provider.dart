// import 'package:blood/models/add_donor/add_donor_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:state_notifier/state_notifier.dart';
//
// final StateNotifierProvider<DonorListProvider> donorListProvider = StateNotifierProvider((_) => DonorListProvider());
//
// class DonorListProvider extends StateNotifier<DonorListState> {
//   DonorListProvider() : super(DonorListState(isLoading: true, donors: []));
//
//   Future<void> obtainDb(String bloodGroup) async {
//     state = state.copyWith(isLoading: true);
//     final _donors = await obtainDataFrmDb(bloodGroup);
//     state = state.copyWith(isLoading: false, donors: _donors);
//   }
// }

// class DonorListState {
//   final bool isLoading;
//   final List<AddDonorModel> donors;
//
//   DonorListState({
//     this.isLoading,
//     this.donors,
//   });
//
//   DonorListState copyWith({bool isLoading, List<AddDonorModel> donors}) => DonorListState(
//         isLoading: isLoading ?? this.isLoading,
//         donors: donors ?? this.donors,
//       );
//
//   @override
//   String toString() => 'DonorListState(isLoading: $isLoading,donors: $donors)';
// }

// Future<List<AddDonorModel>> obtainDataFrmDb(String bloodGroup) async {
//   QuerySnapshot snapshot = await Firestore.instance
//       .collection('donors')
//       .where('donorBloodGroup', isEqualTo: bloodGroup)
// //      .orderBy("createdAt", descending: true)
//       .getDocuments();
//
//   List<AddDonorModel> _donorList = [];
//
//   snapshot.documents.forEach((document) {
//     AddDonorModel food = AddDonorModel.fromMap(document.data);
//     _donorList.add(food);
//   });
//   return _donorList;
// }
