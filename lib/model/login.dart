

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String status;
  String message;
  Data data;

  Welcome({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String token;
  User user;

  Data({
    required this.token,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String name;
  String email;
  String phoneNumber;
  String username;
  String image;
  String certificate;
  String emailVerificationOtp;
  DateTime otpVerificationAt;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.username,
    required this.image,
    required this.certificate,
    required this.emailVerificationOtp,
    required this.otpVerificationAt,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    username: json["username"],
    image: json["image"],
    certificate: json["certificate"],
    emailVerificationOtp: json["email_verification_otp"],
    otpVerificationAt: DateTime.parse(json["otp_verification_at"]),
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "username": username,
    "image": image,
    "certificate": certificate,
    "email_verification_otp": emailVerificationOtp,
    "otp_verification_at": otpVerificationAt.toIso8601String(),
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
