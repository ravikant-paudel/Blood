import 'package:blood/models/request_blood/request_blood_model.dart';
import 'package:blood/utils/constants.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<DashboardProvider, DashboardState> dashboardProvider = StateNotifierProvider(
  (ref) {
    final provider = DashboardProvider()..obtainRequestDb();
    return provider;
  },
);

class DashboardProvider extends StateNotifier<DashboardState> {
  DashboardProvider() : super(DashboardState(isLoading: true, requests: []));

  Future<void> obtainRequestDb() async {
    state = state.copyWith(isLoading: true);
    obtainDataFrmDb().listen((requests) {
      logThis(requests, tag: 'requests List');
      state = state.copyWith(isLoading: false, requests: requests);
    });
  }
}

class DashboardState {
  final bool isLoading;
  final List<RequestBloodModel>? requests;

  DashboardState({
    this.isLoading = false,
    this.requests,
  });

  DashboardState copyWith({bool? isLoading, List<RequestBloodModel>? requests}) => DashboardState(
        isLoading: isLoading ?? this.isLoading,
        requests: requests ?? this.requests,
      );

  @override
  String toString() => 'DashboardState(isLoading: $isLoading,request: $requests)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardState && runtimeType == other.runtimeType && isLoading == other.isLoading && requests == other.requests;

  @override
  int get hashCode => isLoading.hashCode ^ requests.hashCode;
}

Stream<List<RequestBloodModel>> obtainDataFrmDb() {
  return fbWrapper.collectionStream(
    path: Constants.requestCollection,
    builder: (DocumentSnapshot<Map<String, dynamic>> document) {
      final data = document.data();
      if (data == null) {
        logThis('Empty document ${document.id}');
        return RequestBloodModel.empty(); // Ensure you have this method
      }
      return RequestBloodModel.fromJson(data);
    },
  );
}
