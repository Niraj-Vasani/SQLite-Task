import 'dart:ffi';

import 'package:moor_flutter/moor_flutter.dart';

import '../models/audit_entity_model.dart';
import 'moor/audit_entity_database.dart' as database;

abstract class AuditEntityDataSource {
  Stream? watchAuditEntity();
  Future<List<AuditEntityModel>> getAuditEntity();
  Future<Void> editAuditEntity(AuditEntityModel entity);
  Future<Void> deleteAuditEntity(AuditEntityModel entity);
  Future<Void> insertAuditEntity(AuditEntityModel entity);
  Future<Void> addAuditEntityJsonIntoDb(List<AuditEntityModel> entities);
}

class AuditEntityDataSourceImpl implements AuditEntityDataSource {
  final database.AuditDatabase auditDatabase;

  AuditEntityDataSourceImpl(this.auditDatabase);

  @override
  Stream? watchAuditEntity() {
    // final streamData = auditDatabase.watchAllAudits();
    // var result = <AuditEntityModel>[];
    // streamData.listen((data) {
    //   data.forEach((element) {
    //     var entity = AuditEntityModel(
    //       auditEntityId: element.auditEntityId,
    //       auditEntityName: element.auditEntityName,
    //       entityEndDate: element.entityEndDate?.toString(),
    //     );
    //     result.add(entity);
    //   });
    // });
    // yield result;
    return auditDatabase.watchAllAudits();
  }

  @override
  Future<List<AuditEntityModel>> getAuditEntity() async {
    print(1);
    final data = await auditDatabase.getAllAudits();
    print(2);
    var result = <AuditEntityModel>[];
    print(3);
    if (data.length != 0) {
      print(4);
      data.forEach((element) {
        print(5);
        var entity = AuditEntityModel(
          auditEntityId: element.auditEntityId,
          auditEntityName: element.auditEntityName,
          entityEndDate: element.entityEndDate?.toString(),
        );
        print(6);
        result.add(entity);
      });
      print(7);
    }
    print(8);
    // if (result.isNotEmpty) {
    return result;
    // } else {
    //   throw LocalException();
    // }
  }

  @override
  Future<Void> deleteAuditEntity(entity) async {
    var audit = database.Audit(
      auditEntityId: entity.auditEntityId,
      auditEntityName: entity.auditEntityName,
      entityEndDate: (entity.entityEndDate != null)
          ? DateTime.parse(entity.entityEndDate!)
          : null,
    );

    await auditDatabase.deleteAudit(audit);
    return Future.value();
  }

  @override
  Future<Void> editAuditEntity(entity) async {
    var audit = database.AuditsCompanion(
      auditEntityId: Value(entity.auditEntityId),
      auditEntityName: Value(entity.auditEntityName),
      // entityEndDate: Value(DateTime.parse(entity.entityEndDate!)),
    );

    await auditDatabase.updateAudit(audit);
    return Future.value();
  }

  @override
  Future<Void> insertAuditEntity(entity) async {
    var audit = database.AuditsCompanion(
      auditEntityId: Value(entity.auditEntityId),
      auditEntityName: Value(entity.auditEntityName),
      entityEndDate: Value(DateTime.parse(entity.entityEndDate!)),
    );

    await auditDatabase.insertAudit(audit);
    return Future.value();
  }

  @override
  Future<Void> addAuditEntityJsonIntoDb(List<AuditEntityModel> entities) async {
    entities.forEach((element) async {
      var entity = database.AuditsCompanion(
        auditEntityId: Value(element.auditEntityId),
        auditEntityName: Value(element.auditEntityName),
        entityEndDate: Value((element.entityEndDate != null)
            ? DateTime.parse(element.entityEndDate!)
            : null),
      );
      await auditDatabase.insertAudit(entity);
    });
    return Future.value();
  }
}
