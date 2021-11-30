import 'dart:ffi';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/audit_entity.dart';
import '../repositories/audit_entity_repository.dart';

class AddAuditEntityJsonIntoDb implements UseCase<Void, List<AuditEntity>> {
  final AuditEntityRepository repository;

  AddAuditEntityJsonIntoDb(this.repository);

  Future<Either<Failure, Void>?>? call(List<AuditEntity> params) async {
    return await repository.addAuditEntityJsonIntoDb(params);
  }
}
