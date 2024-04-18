// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: file_names
class DoctorsModel {
  String firstname;
  String lastname;
  String clinicorhospitalname;
  String clinicorhospitaladdress;
  String clinicorhospitalcity;
  String clinicorhospitalpincode;
  String qualificaion;
  String specialization;
  String gender;
  String age;
  String email;
  String phonenumber;
  String uid;
  String createdAt;
  String profilePic;
  String role;

  DoctorsModel({
    required this.firstname,
    required this.lastname,
    required this.clinicorhospitalname,
    required this.clinicorhospitaladdress,
    required this.clinicorhospitalcity,
    required this.clinicorhospitalpincode,
    required this.qualificaion,
    required this.specialization,
    required this.gender,
    required this.age,
    required this.email,
    required this.phonenumber,
    required this.uid,
    required this.createdAt,
    required this.profilePic,
    required this.role,
  });

  //from map: getting data from the server
  factory DoctorsModel.fromMap(Map<String, dynamic> map) {
    return DoctorsModel(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      clinicorhospitalname: map['clinicorhospitalname'] as String,
      clinicorhospitaladdress: map['clinicorhospitaladdress'] as String,
      clinicorhospitalcity: map['clinicorhospitalcity'] as String,
      clinicorhospitalpincode: map['clinicorhospitalpincode'] as String,
      qualificaion: map['qualificaion'] as String,
      specialization: map['specialization'] as String,
      gender: map['gender'] as String,
      age: map['age'] as String,
      email: map['email'] as String,
      phonenumber: map['phonenumber'] as String,
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as String,
      profilePic: map['profilePic'] as String,
      role: map['role'] as String,
    );
  }

  //to map: storing data to the server
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'clinicorhospitalname': clinicorhospitalname,
      'clinicorhospitaladdress': clinicorhospitaladdress,
      'clinicorhospitalcity': clinicorhospitalcity,
      'clinicorhospitalpincode': clinicorhospitalpincode,
      'qualificaion': qualificaion,
      'specialization': specialization,
      'gender': gender,
      'age': age,
      'email': email,
      'phonenumber': phonenumber,
      'uid': uid,
      'createdAt': createdAt,
      'profilePic': profilePic,
      'role': role,
    };
  }

  DoctorsModel copyWith({
    String? firstname,
    String? lastname,
    String? clinicorhospitalname,
    String? clinicorhospitaladdress,
    String? clinicorhospitalcity,
    String? clinicorhospitalpincode,
    String? qualificaion,
    String? specialization,
    String? gender,
    String? age,
    String? email,
    String? phonenumber,
    String? uid,
    String? createdAt,
    String? profilePic,
    String? role,
  }) {
    return DoctorsModel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      clinicorhospitalname: clinicorhospitalname ?? this.clinicorhospitalname,
      clinicorhospitaladdress:
          clinicorhospitaladdress ?? this.clinicorhospitaladdress,
      clinicorhospitalcity: clinicorhospitalcity ?? this.clinicorhospitalcity,
      clinicorhospitalpincode:
          clinicorhospitalpincode ?? this.clinicorhospitalpincode,
      qualificaion: qualificaion ?? this.qualificaion,
      specialization: specialization ?? this.specialization,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      email: email ?? this.email,
      phonenumber: phonenumber ?? this.phonenumber,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      profilePic: profilePic ?? this.profilePic,
      role: role ?? this.role,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorsModel.fromJson(String source) =>
      DoctorsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoctorsModel(firstname: $firstname, lastname: $lastname, clinicorhospitalname: $clinicorhospitalname, clinicorhospitaladdress: $clinicorhospitaladdress, clinicorhospitalcity: $clinicorhospitalcity, clinicorhospitalpincode: $clinicorhospitalpincode, qualificaion: $qualificaion, specialization: $specialization, gender: $gender, age: $age, email: $email, phonenumber: $phonenumber, uid: $uid, createdAt: $createdAt, profilePic: $profilePic, role: $role)';
  }

  @override
  bool operator ==(covariant DoctorsModel other) {
    if (identical(this, other)) return true;

    return other.firstname == firstname &&
        other.lastname == lastname &&
        other.clinicorhospitalname == clinicorhospitalname &&
        other.clinicorhospitaladdress == clinicorhospitaladdress &&
        other.clinicorhospitalcity == clinicorhospitalcity &&
        other.clinicorhospitalpincode == clinicorhospitalpincode &&
        other.qualificaion == qualificaion &&
        other.specialization == specialization &&
        other.gender == gender &&
        other.age == age &&
        other.email == email &&
        other.phonenumber == phonenumber &&
        other.uid == uid &&
        other.createdAt == createdAt &&
        other.profilePic == profilePic &&
        other.role == role;
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
        lastname.hashCode ^
        clinicorhospitalname.hashCode ^
        clinicorhospitaladdress.hashCode ^
        clinicorhospitalcity.hashCode ^
        clinicorhospitalpincode.hashCode ^
        qualificaion.hashCode ^
        specialization.hashCode ^
        gender.hashCode ^
        age.hashCode ^
        email.hashCode ^
        phonenumber.hashCode ^
        uid.hashCode ^
        createdAt.hashCode ^
        profilePic.hashCode ^
        role.hashCode;
  }
}
