class Civilian {
  String phoneNumber;
  String password; 
  String nIDN;
  String fullName; 
  String bloodType; 
  DateTime birthDate;
  String email; 
  String medicalCondition;
  String notificationToken;

  Civilian({
    this.phoneNumber,this.password,this.nIDN,this.birthDate,
    this.bloodType,this.email,this.fullName,
    this.medicalCondition,this.notificationToken});


  factory Civilian.fromJson(Map<String, dynamic> json) {
    return Civilian(
      phoneNumber: json['phoneNumber'],
      birthDate: DateTime.tryParse(json['birthDate']),
      bloodType: json['bloodType'],
      email: json['email'],
      fullName: json['fullName'],
      medicalCondition: json['medicalCondition'],
      nIDN: json['nidn'],
      notificationToken: json['notificationToken'],
      password: json['password'],
    );
  }

}