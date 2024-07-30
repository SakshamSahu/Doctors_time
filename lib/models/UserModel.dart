// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: file_names
class UserModel {
  String firstname;
  String lastname;
  String age;
  String address;
  String city;
  String pincode;
  String email;
  String phonenumber;
  String uid;
  String createdAt;
  String profilePic;
  String role;
  String gender;

  UserModel({
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.address,
    required this.city,
    required this.pincode,
    required this.email,
    required this.phonenumber,
    required this.uid,
    required this.createdAt,
    required this.profilePic,
    required this.role,
    required this.gender,
  });

  //from map: getting data from the server
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      age: map['age'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      pincode: map['pincode'] as String,
      email: map['email'] as String,
      phonenumber: map['phonenumber'] as String,
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as String,
      profilePic: map['profilePic'] as String,
      role: map['role'] as String,
      gender: map['gender'] as String,
    );
  }

  //to map: storing data to the server
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
      'address': address,
      'city': city,
      'pincode': pincode,
      'email': email,
      'phonenumber': phonenumber,
      'uid': uid,
      'createdAt': createdAt,
      'profilePic': profilePic,
      'role': role,
      'gender': gender,
    };
  }

  UserModel copyWith({
    String? firstname,
    String? lastname,
    String? age,
    String? address,
    String? city,
    String? pincode,
    String? email,
    String? phonenumber,
    String? uid,
    String? createdAt,
    String? profilePic,
    String? role,
    String? gender,
  }) {
    return UserModel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      age: age ?? this.age,
      address: address ?? this.address,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      email: email ?? this.email,
      phonenumber: phonenumber ?? this.phonenumber,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      profilePic: profilePic ?? this.profilePic,
      role: role ?? this.role,
      gender: gender ?? this.gender,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstname: $firstname, lastname: $lastname, age: $age, address: $address, city: $city, pincode: $pincode, email: $email, phonenumber: $phonenumber, uid: $uid, createdAt: $createdAt, profilePic: $profilePic, role: $role, gender: $gender)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstname == firstname &&
        other.lastname == lastname &&
        other.age == age &&
        other.address == address &&
        other.city == city &&
        other.pincode == pincode &&
        other.email == email &&
        other.phonenumber == phonenumber &&
        other.uid == uid &&
        other.createdAt == createdAt &&
        other.profilePic == profilePic &&
        other.role == role &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
        lastname.hashCode ^
        age.hashCode ^
        address.hashCode ^
        city.hashCode ^
        pincode.hashCode ^
        email.hashCode ^
        phonenumber.hashCode ^
        uid.hashCode ^
        createdAt.hashCode ^
        profilePic.hashCode ^
        role.hashCode ^
        gender.hashCode;
  }
}
