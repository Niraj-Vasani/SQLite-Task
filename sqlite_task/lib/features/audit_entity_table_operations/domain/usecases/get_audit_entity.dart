import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/audit_entity.dart';
import '../repositories/audit_entity_repository.dart';

class GetAuditEntity implements UseCase<List<AuditEntity?>, NoParams> {
  final AuditEntityRepository repository;

  GetAuditEntity(this.repository);

  Future<Either<Failure, List<AuditEntity?>>?>? call(NoParams noParams) async {
    return await repository.getAuditEntity();
  }
}
