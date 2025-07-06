import 'package:blog_app/features/auth/domain/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({required super.id, required super.name, required super.email});

  factory ProfileModel.fromJson(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
