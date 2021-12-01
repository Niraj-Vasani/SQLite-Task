import 'package:get_it/get_it.dart';
import 'package:sqlite_task/features/audit_entity_table_operations/domain/usecases/watch_audit_entity.dart';
import 'features/audit_entity_table_operations/data/datasources/audit_entity_data_source.dart';
import 'features/audit_entity_table_operations/data/datasources/moor/audit_entity_database.dart';
import 'features/audit_entity_table_operations/data/repositories/audit_entity_repository_impl.dart';
import 'features/audit_entity_table_operations/domain/repositories/audit_entity_repository.dart';
import 'features/audit_entity_table_operations/domain/usecases/add_audit_entity_json_into_db.dart';
import 'features/audit_entity_table_operations/domain/usecases/delete_audit_entity.dart';
import 'features/audit_entity_table_operations/domain/usecases/edit_audit_entity.dart';
import 'features/audit_entity_table_operations/domain/usecases/get_audit_entity.dart';
import 'features/audit_entity_table_operations/domain/usecases/insert_audit_entity.dart';
import 'features/audit_entity_table_operations/presentation/cubit/audit_entity_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // cubit
  sl.registerFactory<AuditEntityCubit>(
    () => AuditEntityCubit(
      getAuditEntityUsecase: sl.call(),
      editAuditEntityUsecase: sl.call(),
      deleteAuditEntityUsecase: sl.call(),
      insertAuditEntityUsecase: sl.call(),
      addAuditEntityJsonIntoDbUsecase: sl.call(),
      watchAuditEntityUsecase: sl.call(),
    ),
  );

  // database
  sl.registerLazySingleton<AuditDatabase>(() => AuditDatabase());

  // usecases
  sl.registerLazySingleton<WatchAuditEntity>(() => WatchAuditEntity(sl.call()));
  sl.registerLazySingleton<GetAuditEntity>(() => GetAuditEntity(sl.call()));
  sl.registerLazySingleton<EditAuditEntity>(() => EditAuditEntity(sl.call()));
  sl.registerLazySingleton<DeleteAuditEntity>(
      () => DeleteAuditEntity(sl.call()));
  sl.registerLazySingleton<InsertAuditEntity>(
      () => InsertAuditEntity(sl.call()));
  sl.registerLazySingleton<AddAuditEntityJsonIntoDb>(
      () => AddAuditEntityJsonIntoDb(sl.call()));

  // repository
  sl.registerLazySingleton<AuditEntityRepository>(
      () => AuditEntityRepositoryImpl(dataSource: sl.call()));

  // datasource
  sl.registerLazySingleton<AuditEntityDataSource>(
      () => AuditEntityDataSourceImpl(sl.call()));
}
