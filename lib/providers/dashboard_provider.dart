import 'package:blood/models/request_blood/request_blood_model.dart';
import 'package:blood/utils/constants.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<DashboardProvider, DashboardState> dashboardProvider = StateNotifierProvider((_) => DashboardProvider());

class DashboardProvider extends StateNotifier<DashboardState> {
  DashboardProvider() : super(DashboardState(isLoading: true, requests: []));

  Future<void> obtainRequestDb() async {
    state = state.copyWith(isLoading: true);
    obtainDataFrmDb().listen((requests) {
      logThis('The req is ============<><<><<>');
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
}

Stream<List<RequestBloodModel>> obtainDataFrmDb() {
  return fbWrapper.getStreamListFrmDb(
    Constants.request_collection,
    (document) {
      final data = document.data();
      if (data == null) return RequestBloodModel.fromJson(const {});
      return RequestBloodModel.fromJson(data);
    },
  );
}

// Future<List<RequestBloodModel>> obtainDataFrmDb() async {
//   QuerySnapshot snapshot = await Firestore.instance.collection('request').orderBy("createdAt", descending: true).getDocuments();
//
//   List<RequestBloodModel> _dashboardList = [];
//
//   snapshot.documents.forEach((document) {
//     RequestBloodModel request = RequestBloodModel.fromMap(document.data);
//     _dashboardList.add(request);
//   });
//   return _dashboardList;
// }
