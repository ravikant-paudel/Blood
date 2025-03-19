// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_blood_model.freezed.dart';
part 'request_blood_model.g.dart';

@freezed
abstract class RequestBloodModel with _$RequestBloodModel {
  // Add empty factory constructor
  factory RequestBloodModel.empty() => RequestBloodModel(
        id: '',
        patientName: '',
        patientBedNumber: '',
        bloodGroup: '',
        patientLocation: '',
        contactNumber: '',
        patientAge: '',
        district: '',
        submittedBy: '',
        patientSex: '',
        requestTime: '',
        bloodUnit: '',
        relation: '',
        hospitalInfo: '',
        createdAt: DateTime.now(),
      );

  // Rest of your existing code
  factory RequestBloodModel({
    required String id,
    required String patientName,
    required String patientBedNumber,
    required String bloodGroup,
    required String patientLocation,
    required String contactNumber,
    required String patientAge,
    required String district,
    required String submittedBy,
    required String patientSex,
    required String requestTime,
    required String bloodUnit,
    required String relation,
    required String hospitalInfo,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _timestampFromDateTime) required DateTime createdAt,
  }) = _RequestBloodModel;

  factory RequestBloodModel.fromJson(Map<String, dynamic> json) => _$RequestBloodModelFromJson(json);
}

DateTime _dateTimeFromTimestamp(Timestamp timestamp) {
  return timestamp.toDate();
}

Timestamp _timestampFromDateTime(DateTime dateTime) {
  return Timestamp.fromDate(dateTime);
}
