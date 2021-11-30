import 'dart:ffi';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/audit_entity.dart';
import '../repositories/audit_entity_repository.dart';

class InsertAuditEntity implements UseCase<Void, AuditEntity> {
  final AuditEntityRepository repository;

  InsertAuditEntity(this.repository);

  Future<Either<Failure, Void>?>? call(AuditEntity params) async {
    return await repository.insertAuditEntity(params);
  }
}
