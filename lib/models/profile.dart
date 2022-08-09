part of homepage;

class Profile {
  final ImageProvider photo;
  final String name;
  final String email;

  const Profile({required this.photo, required this.name, required this.email});
}

Profile getProfile() {
  return const Profile(
      photo: AssetImage('assets/images/user_icon.png'),
      name: "Supervisor",
      email: "supervisor@iafsm.com");
}
