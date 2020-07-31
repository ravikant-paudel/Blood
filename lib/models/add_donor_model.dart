class AddDonorModel {
  String aDid;
  String donorName;
  String donorNumber;
  String bloodGroup;

  AddDonorModel({
    this.aDid,
    this.donorName,
    this.donorNumber,
    this.bloodGroup,
  });

  Map<String, dynamic> toMap(AddDonorModel user) {
    final data = <String, dynamic>{};
    data['aDid'] = user.aDid;
    data['donorName'] = user.donorName;
    data['donorNumber'] = user.donorNumber;
    data['bloodGroup'] = user.bloodGroup;
    return data;
  }

  AddDonorModel.fromMap(Map<String, dynamic> mapData) {
    aDid = mapData['aDid'] as String;
    donorName = mapData['donorName'] as String;
    donorNumber = mapData['donorNumber'] as String;
    bloodGroup = mapData['bloodGroup'] as String;
  }

}
