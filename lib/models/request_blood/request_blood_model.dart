import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_blood_model.freezed.dart';

part 'request_blood_model.g.dart';

@freezed
abstract class RequestBloodModel with _$RequestBloodModel {
  @JsonSerializable()
  factory RequestBloodModel({
    String patientName,
    String bloodGroup,
    String patientLocation,
    String contactNumber,
    String patientAge,
    String district,
    String submittedBy,
    int createdAt,
  }) = _RequestBloodModel;

  factory RequestBloodModel.fromJson(Map<String, dynamic> json) => _$RequestBloodModelFromJson(json);
}

// class RequestBloodModel {
//   String patientName;
//   String bloodGroup;
//   String patientLocation;
//   String contactNumber;
//   String patientAge;
//   String district;
//   String submittedBy;
//   int createdAt;
//
//   RequestBloodModel({
//     this.patientName,
//     this.bloodGroup,
//     this.patientLocation,
//     this.contactNumber,
//     this.patientAge,
//     this.district,
//     this.submittedBy,
//     this.createdAt,
//   });
//
//   Map<String, dynamic> toMap(RequestBloodModel request) {
//     final data = <String, dynamic>{};
//     data['patientName'] = request.patientName;
//     data['bloodGroup'] = request.bloodGroup;
//     data['patientLocation'] = request.patientLocation;
//     data['contactNumber'] = request.contactNumber;
//     data['patientAge'] = request.patientAge;
//     data['district'] = request.district;
//     data['submittedBy'] = request.submittedBy;
//     data['createdAt'] = request.createdAt;
//     return data;
//   }
//
//   RequestBloodModel.fromMap(Map<String, dynamic> mapData) {
//     patientName = mapData['patientName'] as String;
//     bloodGroup = mapData['bloodGroup'] as String;
//     patientLocation = mapData['patientLocation'] as String;
//     contactNumber = mapData['contactNumber'] as String;
//     patientAge = mapData['patientAge'] as String;
//     district = mapData['district'] as String;
//     submittedBy = mapData['submittedBy'] as String;
//     createdAt = mapData['createdAt'] as int;
//   }
//
// }
