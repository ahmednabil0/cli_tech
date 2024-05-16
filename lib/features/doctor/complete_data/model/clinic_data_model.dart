class ClinicDataModel {
  String address;
  Map<String, dynamic> addressDetails;
  String aboutMe;
  String numOfYears;
  List<String> offDays;
  String fromTime;
  String toTime;
  ClinicDataModel({
    required this.address,
    required this.addressDetails,
    required this.aboutMe,
    required this.numOfYears,
    required this.offDays,
    required this.fromTime,
    required this.toTime,
  });

  factory ClinicDataModel.fromMap(Map<String, dynamic> map) {
    return ClinicDataModel(
      address: map['address'] ?? '',
      addressDetails: map['addressDetails'] ?? {},
      aboutMe: map['aboutMe'] ?? '',
      numOfYears: map['numOfYears'] ?? '',
      offDays: List<String>.from(map['offDays']),
      fromTime: map['fromTime'] ?? '',
      toTime: map['toTime'] ?? '',
    );
  }
}
