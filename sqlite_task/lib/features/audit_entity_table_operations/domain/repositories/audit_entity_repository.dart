import 'dart:ffi';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/audit_entity.dart';

abstract class AuditEntityRepository {
  Stream? watchAuditEntity();
  Future<Either<Failure, List<AuditEntity?>>?>? getAuditEntity();
  Future<Either<Failure, Void>?>? editAuditEntity(AuditEntity auditEntity);
  Future<Either<Failure, Void>?>? deleteAuditEntity(AuditEntity auditEntity);
  Future<Either<Failure, Void>?>? insertAuditEntity(AuditEntity auditEntity);
  Future<Either<Failure, Void>?>? addAuditEntityJsonIntoDb(
      List<AuditEntity> auditEntities);
}
