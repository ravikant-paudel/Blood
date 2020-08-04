import 'package:blood/models/request_blood_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<DashboardProvider> dashboardProvider = StateNotifierProvider((_) => DashboardProvider());

class DashboardProvider extends StateNotifier<DashboardState> {
  DashboardProvider() : super(DashboardState(isLoading: true, request: []));

  Future<void> obtainRequestDb() async {
    state = state.copyWith(isLoading: true);
    final _request = await obtainDataFrmDb();
    state = state.copyWith(isLoading: false, request: _request);
  }
}

class DashboardState {
  final bool isLoading;
  final List<RequestBloodModel> request;

  DashboardState({
    this.isLoading,
    this.request,
  });

  DashboardState copyWith({bool isLoading, List<RequestBloodModel> request}) => DashboardState(
        isLoading: isLoading ?? this.isLoading,
        request: request ?? this.request,
      );

  @override
  String toString() => 'DashboardState(isLoading: $isLoading,request: $request)';
}

Future<List<RequestBloodModel>> obtainDataFrmDb() async {
  QuerySnapshot snapshot = await Firestore.instance.collection('request').orderBy("createdAt", descending: true).getDocuments();

  List<RequestBloodModel> _dashboardList = [];

  snapshot.documents.forEach((document) {
    RequestBloodModel request = RequestBloodModel.fromMap(document.data);
    _dashboardList.add(request);
  });
  return _dashboardList;
}
