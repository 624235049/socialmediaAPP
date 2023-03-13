class UserModelT {
  String uid;
  String fullName;
  String nickname;
  String gender;
  String birthDate;
  String email;
  String phoneNumber;
  String skills;
  String positionOfInternship;
  String imageUri;
  String expect;




  UserModelT({
    required this.uid,
    required this.fullName,
    required this.nickname,
    required this.gender,
    required this.birthDate,
    required this.email,
    required this.phoneNumber,
    required this.skills,
    required this.expect,
    required this.positionOfInternship,
    required this.imageUri,



  });

  Map<String,dynamic> toMap(){
    return {
      'uid': uid,
      'full_name': fullName,
      'nickname': nickname,
      'gender': gender,
      'birth_date': birthDate,
      'email': email,
      'expect': expect,
      'phone_number':phoneNumber,
      'skills':skills,
      'position_of_internship': positionOfInternship,
      'image_uri': imageUri
    };
  }

}