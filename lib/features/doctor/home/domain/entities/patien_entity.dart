class PatientEntity {
  final String name;
  final int age;
  final String gender;
  final DateTime appointmentTime;
  final String imageUrl;

  const PatientEntity({
    required this.name,
    required this.age,
    required this.gender,
    required this.appointmentTime,
    required this.imageUrl,
  });
}
