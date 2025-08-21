import 'package:hive/hive.dart';
import 'package:patient_appointment/features/home/domain/entities/patien_entity.dart';
part 'patient_model.g.dart';

@HiveType(typeId: 0)
class PatientModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  String gender;

  @HiveField(3)
  DateTime appointmentTime;

  @HiveField(4)
  String imageUrl;

  PatientModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.appointmentTime,
    required this.imageUrl,
  });

  PatientEntity toEntity() => PatientEntity(
    name: name,
    age: age,
    gender: gender,
    appointmentTime: appointmentTime,
    imageUrl: imageUrl,
  );

  static PatientModel fromEntity(PatientEntity entity) => PatientModel(
    name: entity.name,
    age: entity.age,
    gender: entity.gender,
    appointmentTime: entity.appointmentTime,
    imageUrl: entity.imageUrl,
  );
}
