import 'package:moor_flutter/moor_flutter.dart';

part 'audit_entity_database.g.dart';

class Audits extends Table {
  IntColumn get auditEntityId => integer().autoIncrement()();
  TextColumn get auditEntityName => text().withLength(min: 1, max: 50)();
  DateTimeColumn get entityEndDate => dateTime().nullable()();
}

@UseMoor(tables: [Audits])
class AuditDatabase extends _$AuditDatabase {
  AuditDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite",
            logStatements: true,
            singleInstance: true,
          ),
        );

  @override
  int get schemaVersion => 1;

  Future<List<Audit>> getAllAudits() => select(audits).get();
  Stream<List<Audit>> watchAllAudits() => select(audits).watch();
  Future insertAudit(AuditsCompanion audit) => into(audits).insert(audit);
  Future updateAudit(AuditsCompanion audit) => update(audits).replace(audit);
  Future deleteAudit(Audit audit) => delete(audits).delete(audit);
}

// class Audits extends Table {
//   IntColumn get auditEntityId => integer().autoIncrement()();
//   TextColumn get auditEntityName => text().withLength(min: 1, max: 50)();
//   DateTimeColumn get entityEndDate => dateTime().nullable()();
// }

// @UseMoor(tables: [Audits])
// class AuditDatabase extends _$AuditDatabase {
//   AuditDatabase()
//       : super(
//           FlutterQueryExecutor.inDatabaseFolder(
//             path: "db.sqlite",
//             logStatements: true,
//             singleInstance: true,
//           ),
//         );

//   @override
//   int get schemaVersion => 1;

//   Future<List<Audit>> getAllTasks() => select(audits).get();
//   Stream<List<Audit>> watchAllTasks() => select(audits).watch();
//   Future insertTask(AuditsCompanion audit) => into(audits).insert(audit);
//   Future updateTask(AuditsCompanion audit) => update(audits).replace(audit);
//   Future deleteTask(Audit audit) => delete(audits).delete(audit);
// }
