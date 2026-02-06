class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int age;
  final String gender;
  final String phone;
  final String birthDate;
  final String bloodGroup;
  final String university;
  final String role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.age,
    required this.gender,
    required this.phone,
    required this.birthDate,
    required this.bloodGroup,
    required this.university,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      image: json['image'],
      age: json['age'],
      gender: json['gender'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      bloodGroup: json['bloodGroup'],
      university: json['university'],
      role: json['role'],
    );
  }
}
