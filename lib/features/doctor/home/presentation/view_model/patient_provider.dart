import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:patient_appointment/features/doctor/home/domain/entities/patien_entity.dart';
import 'package:patient_appointment/features/doctor/home/domain/repo/patient_repo.dart';

@injectable
class PatientProvider extends ChangeNotifier {
  final PatientRepository repository;

  PatientProvider(this.repository);

  List<PatientEntity> _patients = [];
  List<PatientEntity> get patients => _patients;

  Future<void> loadPatients() async {
    _patients = await repository.getPatients();
    notifyListeners();
  }

  Future<void> addPatient(PatientEntity patient) async {
    await repository.addPatient(patient);
    await loadPatients();
  }

  Future<void> updatePatient(int index, PatientEntity patient) async {
    await repository.updatePatient(index, patient);
    await loadPatients();
  }

  List<PatientEntity> get upcoming => _patients
      .where((p) => p.appointmentTime.isAfter(DateTime.now()))
      .toList();

  List<PatientEntity> get missed => _patients
      .where((p) => p.appointmentTime.isBefore(DateTime.now()))
      .toList();

  List<PatientEntity> get completed => _patients
      .where(
        (p) =>
            p.appointmentTime.isBefore(DateTime.now()) &&
            p.appointmentTime.day == DateTime.now().day,
      )
      .toList();
}
