// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_blood_model.freezed.dart';
part 'request_blood_model.g.dart';

@freezed
abstract class RequestBloodModel with _$RequestBloodModel {
  factory RequestBloodModel({
    required String patientName,
    required String bloodGroup,
    required String patientLocation,
    required String contactNumber,
    required String patientAge,
    required String district,
    required String submittedBy,
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
