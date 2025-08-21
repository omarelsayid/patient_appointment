import 'package:patient_appointment/features/home/domain/entities/patien_entity.dart';

abstract class PatientRepository {
  Future<List<PatientEntity>> getPatients();
  Future<void> addPatient(PatientEntity patient);
}
