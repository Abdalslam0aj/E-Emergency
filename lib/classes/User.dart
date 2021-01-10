class User{
  String phoneNumber;
  String userType;

  User({this.phoneNumber,this.userType});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phoneNumber: json['phoneNumber'],
      userType: json['userType'],
      
    );
  }



}