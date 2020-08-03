class AddDonorModel {
  String donorName;
  String donorNumber;
  String donorBloodGroup;
  String addedBy;
  int timestamp;

  AddDonorModel({
    this.donorName,
    this.donorNumber,
    this.donorBloodGroup,
    this.addedBy,
    this.timestamp,
  });

  Map<String, dynamic> toMap(AddDonorModel user) {
    final data = <String, dynamic>{};
//    data['aDid'] = user.aDid;
    data['donorName'] = user.donorName;
    data['donorNumber'] = user.donorNumber;
    data['donorBloodGroup'] = user.donorBloodGroup;
    data['addedBy'] = user.addedBy;
    data['timestamp'] = user.timestamp;
    return data;
  }

  AddDonorModel.fromMap(Map<String, dynamic> mapData) {
//    aDid = mapData['aDid'] as String;
    donorName = mapData['donorName'] as String;
    donorNumber = mapData['donorNumber'] as String;
    donorBloodGroup = mapData['donorBloodGroup'] as String;
    addedBy = mapData['addedBy'] as String;
    timestamp = mapData['timestamp'] as int;
  }

}
