import 'package:sqlite_task/features/audit_entity_table_operations/domain/repositories/audit_entity_repository.dart';

class WatchAuditEntity {
  final AuditEntityRepository repository;

  WatchAuditEntity(this.repository);

  Stream? call() {
    return repository.watchAuditEntity();
  }
}
