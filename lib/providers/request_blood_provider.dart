import 'package:blood/models/request_blood_model.dart';
import 'package:blood/utils/preference_util.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<RequestBloodProvider> requestBloodProvider = StateNotifierProvider((_) => RequestBloodProvider());

class RequestBloodProvider extends StateNotifier<RequestBloodState> {
  RequestBloodProvider() : super(RequestBloodState(isLoading: false, isSuccess: false));

  void submitBloodRequest() {
    state = state.copyWith(isLoading: true);
    // addBloodRequestToDb(state);
    state = state.copyWith(isLoading: false, isSuccess: true);
  }

  void updatePatientName(String name) {
    state = state.copyWith(patientName: name);

  }
  void updateBloodGroup(String blood) {
    state = state.copyWith(bloodGroup: blood);
  }
  void updatePatientLocation(String location) {
    state = state.copyWith(patientLocation: location);
  }
  void updateContactNumber(String number) {
    state = state.copyWith(contactNumber: number);
  }
  void updatePatientAge(String age) {
    state = state.copyWith(patientAge: age);
  }
  void updateDistrict(String district) {
    state = state.copyWith(district: district);
  }
}

class RequestBloodState {
  final bool isLoading;
  final bool isSuccess;
  final String patientName, bloodGroup, patientLocation, contactNumber, patientAge, district;

  RequestBloodState({
    this.isLoading,
    this.isSuccess,
    this.patientName,
    this.patientLocation,
    this.bloodGroup,
    this.contactNumber,
    this.patientAge,
    this.district,
  });

  RequestBloodState copyWith(
          {bool isLoading,
          bool isSuccess,
          String patientName,
          String patientLocation,
          String bloodGroup,
          String contactNumber,
          String patientAge,
          String district
          }) =>
      RequestBloodState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        patientName: patientName ?? this.patientName,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        contactNumber: contactNumber ?? this.contactNumber,
        patientAge: patientAge ?? this.patientAge,
        patientLocation: patientLocation ?? this.patientLocation,
        district: district ?? this.district,
      );

  @override
  String toString() => 'RequestBloodState(isLoading: $isLoading,isSuccess: $isSuccess,'
      ' patientName: $patientName,bloodGroup: $bloodGroup,'
      'contactNumber: $contactNumber, patientAge: $patientAge,district: $district)';
}

// final Firestore _firestore = Firestore.instance;
//
// Future<void> addBloodRequestToDb(RequestBloodState state) async {
//   RequestBloodModel requestBlood = RequestBloodModel();
//   final uId = preference.get(PreferenceKey.USER_ID);
//   requestBlood = RequestBloodModel(
//       patientName: state.patientName,
//       bloodGroup: state.bloodGroup,
//       patientLocation: state.patientLocation,
//       contactNumber: state.contactNumber,
//       patientAge: state.patientAge,
//       district: state.district,
//       submittedBy: uId.toString(),
//       createdAt: DateTime.now().toUtc().millisecondsSinceEpoch);
//
//   _firestore.collection("request").add(requestBlood.toMap(requestBlood));
// }
