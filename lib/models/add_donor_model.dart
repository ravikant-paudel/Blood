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
//    data['aDid'] = user.aDid;
    data['donorName'] = user.donorName;
    data['donorNumber'] = user.donorNumber;
    data['donorBloodGroup'] = user.donorBloodGroup;
    data['submittedBy'] = user.submittedBy;
    data['createdAt'] = user.createdAt;
    return data;
  }

  AddDonorModel.fromMap(Map<String, dynamic> mapData) {
//    aDid = mapData['aDid'] as String;
    donorName = mapData['donorName'] as String;
    donorNumber = mapData['donorNumber'] as String;
    donorBloodGroup = mapData['donorBloodGroup'] as String;
    submittedBy = mapData['submittedBy'] as String;
    createdAt = mapData['createdAt'] as int;
  }

}
