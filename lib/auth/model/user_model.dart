class UserModel {
  final String name;
  final String gender;
  final String role;
  final String email;
  final String phone;
  final String id;
  final String? std;
  final String? accessToken;

  UserModel(
      {required this.email,
      required this.name,
      required this.gender,
      required this.role,
      required this.phone,
      required this.id,
       this.accessToken,
      this.std});
}
