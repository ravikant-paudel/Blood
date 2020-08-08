

/*import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_donor_model.freezed.dart';


@freezed
abstract class AddDonorModel with _$AddDonorModel {
  const factory AddDonorModel({
    String donorName,
    String donorNumber,
    String donorBloodGroup,
    String submittedBy,
    int createdAt,
  }) = _AddDonorModel;
}*/


class AddDonorModel {
  String donorName;
  String donorNumber;
  String donorBloodGroup;
  String submittedBy;
  int createdAt;

  AddDonorModel({
    this.donorName,
    this.donorNumber,
    this.donorBloodGroup,
    this.submittedBy,
    this.createdAt,
  });

  Map<String, dynamic> toMap(AddDonorModel user) {
    final data = <String, dynamic>{};
    data['donorName'] = user.donorName;
    data['donorNumber'] = user.donorNumber;
    data['donorBloodGroup'] = user.donorBloodGroup;
    data['submittedBy'] = user.submittedBy;
    data['createdAt'] = user.createdAt;
    return data;
  }

  AddDonorModel.fromMap(Map<String, dynamic> mapData) {
    donorName = mapData['donorName'] as String;
    donorNumber = mapData['donorNumber'] as String;
    donorBloodGroup = mapData['donorBloodGroup'] as String;
    submittedBy = mapData['submittedBy'] as String;
    createdAt = mapData['createdAt'] as int;
  }

}
