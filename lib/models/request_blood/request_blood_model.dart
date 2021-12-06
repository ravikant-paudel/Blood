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
    required int createdAt,
  }) = _RequestBloodModel;

  factory RequestBloodModel.fromJson(Map<String, dynamic> json) => _$RequestBloodModelFromJson(json);
}
