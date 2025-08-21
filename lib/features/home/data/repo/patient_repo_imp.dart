import 'package:injectable/injectable.dart';
import 'package:patient_appointment/features/home/data/data_source/patient_local_data_source/patient_local_data_source.dart';
import 'package:patient_appointment/features/home/data/models/patient_model.dart';
import 'package:patient_appointment/features/home/domain/entities/patien_entity.dart';
import 'package:patient_appointment/features/home/domain/repo/patient_repo.dart';

@Injectable(as: PatientRepository)
class PatientRepositoryImpl implements PatientRepository {
  final PatientLocalDataSource localDataSource;

  PatientRepositoryImpl(this.localDataSource);

  @override
  Future<List<PatientEntity>> getPatients() async {
    final models = await localDataSource.getPatients();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> addPatient(PatientEntity patient) async {
    final model = PatientModel.fromEntity(patient);
    await localDataSource.addPatient(model);
  }
}
