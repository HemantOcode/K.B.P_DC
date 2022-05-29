class UserModel {
  final String name;
  final String gender;
  final String role;
  final String email;
  final String phone;
  final String id;
  final String? std;

  UserModel(
      {required this.email,
      required this.name,
      required this.gender,
      required this.role,
      required this.phone,
      required this.id,
      this.std});
}
