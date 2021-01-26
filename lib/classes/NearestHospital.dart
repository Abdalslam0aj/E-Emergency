class NearestHospital {
  int id;
  String name;
  double latitude;
  double longitude;
  NearestHospital({this.id, this.name, this.latitude, this.longitude});

  factory NearestHospital.fromJson(Map<String, dynamic> json) {
    print(json['name']);
    return NearestHospital(
        id: json['id'],
        name: json['name'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
  static newHospitalTest({String phoneNumber, var latitude, var longitude}) {}
}
