import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:patient_appointment/features/home/data/data_source/patient_local_data_source/patient_local_data_source.dart';
import 'package:patient_appointment/features/home/data/models/patient_model.dart';

@Injectable(as: PatientLocalDataSource)
class PatientLocalDataSourceImpl implements PatientLocalDataSource {
  final Box<PatientModel> box;

  PatientLocalDataSourceImpl(this.box);

  @override
  Future<List<PatientModel>> getPatients() async {
    return box.values.toList();
  }

  @override
  Future<void> addPatient(PatientModel patient) async {
    await box.add(patient);
  }
}
