class Profile {
  final String id;
  final String name;
  final String email;

  Profile({required this.id, required this.name, required this.email});

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, email: $email)';
  }
}
