import 'package:patient_appointment/features/home/data/models/patient_model.dart';

abstract class PatientLocalDataSource {
  Future<List<PatientModel>> getPatients();
  Future<void> addPatient(PatientModel patient);
}
