import '../../../../core/error/exceptions.dart';
import '../datasources/audit_entity_data_source.dart';
import '../models/audit_entity_model.dart';
import '../../domain/entities/audit_entity.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'dart:ffi';

import '../../domain/repositories/audit_entity_repository.dart';

class AuditEntityRepositoryImpl implements AuditEntityRepository {
  final AuditEntityDataSource dataSource;

  AuditEntityRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<AuditEntity?>>?>? getAuditEntity() async {
    try {
      final entityDatas = await dataSource.getAuditEntity();
      return Right(entityDatas);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Void>?>? deleteAuditEntity(
      AuditEntity auditEntity) async {
    try {
      final nothing =
          await dataSource.deleteAuditEntity(auditEntity as AuditEntityModel);
      return Right(nothing);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Void>?>? editAuditEntity(
      AuditEntity auditEntity) async {
    try {
      final nothing =
          await dataSource.editAuditEntity(auditEntity as AuditEntityModel);
      return Right(nothing);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Void>?>? insertAuditEntity(
      AuditEntity auditEntity) async {
    try {
      final nothing =
          await dataSource.insertAuditEntity(auditEntity as AuditEntityModel);
      return Right(nothing);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Void>?>? addAuditEntityJsonIntoDb(
      List<AuditEntity> auditEntities) async {
    try {
      final nothing = await dataSource
          .addAuditEntityJsonIntoDb(auditEntities as List<AuditEntityModel>);
      return Right(nothing);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
