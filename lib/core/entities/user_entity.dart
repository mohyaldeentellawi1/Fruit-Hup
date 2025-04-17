class UserEntity {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImageUrl;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profileImageUrl,
  });
}
