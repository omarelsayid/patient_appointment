// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:patient_appointment/core/di/hive_module.dart' as _i880;
import 'package:patient_appointment/features/doctor/home/data/data_source/patient_local_data_source/patient_local_data_source.dart'
    as _i1042;
import 'package:patient_appointment/features/doctor/home/data/data_source/patient_local_data_source/patient_local_data_source_imp.dart'
    as _i219;
import 'package:patient_appointment/features/doctor/home/data/models/patient_model.dart'
    as _i656;
import 'package:patient_appointment/features/doctor/home/data/repo/patient_repo_imp.dart'
    as _i974;
import 'package:patient_appointment/features/doctor/home/domain/repo/patient_repo.dart'
    as _i129;
import 'package:patient_appointment/features/doctor/home/presentation/view_model/patient_provider.dart'
    as _i604;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final hiveModule = _$HiveModule();
    await gh.factoryAsync<_i979.Box<_i656.PatientModel>>(
      () => hiveModule.patientBox,
      preResolve: true,
    );
    gh.factory<_i1042.PatientLocalDataSource>(
      () =>
          _i219.PatientLocalDataSourceImpl(gh<_i979.Box<_i656.PatientModel>>()),
    );
    gh.factory<_i129.PatientRepository>(
      () => _i974.PatientRepositoryImpl(gh<_i1042.PatientLocalDataSource>()),
    );
    gh.factory<_i604.PatientProvider>(
      () => _i604.PatientProvider(gh<_i129.PatientRepository>()),
    );
    return this;
  }
}

class _$HiveModule extends _i880.HiveModule {}
