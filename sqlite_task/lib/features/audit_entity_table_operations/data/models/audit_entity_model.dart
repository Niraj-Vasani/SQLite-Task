import '../../domain/entities/audit_entity.dart';

class AuditEntityModel extends AuditEntity {
  AuditEntityModel({
    required int auditEntityId,
    required String auditEntityName,
    String? entityEndDate,
  }) : super(
          auditEntityId: auditEntityId,
          auditEntityName: auditEntityName,
          entityEndDate: entityEndDate,
        );

  factory AuditEntityModel.fromJson(Map<String, dynamic> json) {
    return AuditEntityModel(
      // auditEntityId: json["AuditEntityId"] ?? 1,
      // auditEntityName: json["AuditEntityName"] ?? "Unknown",
      // entityEndDate: json["EntityEndDate"] ?? "No Date",
      auditEntityId: json["AuditEntityId"],
      auditEntityName: json["AuditEntityName"],
      entityEndDate: json["EntityEndDate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "auditEntityId": auditEntityId,
      "auditEntityName": auditEntityName,
      "entityEndDate": entityEndDate,
    };
  }
}


// class AuditEntityResponse {
//   AuditEntityResponse({
//     required this.auditEntity,
//   });
//   late final List<AuditEntityModel> auditEntity;

//   AuditEntityResponse.fromJson(Map<String, dynamic> json) {
//     auditEntity = List.from(json['auditEntity'])
//         .map((e) => AuditEntityModel.fromJson(e))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['auditEntity'] = auditEntity.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class AuditEntityModel {
//   AuditEntityModel({
//     required this.auditEntityId,
//     required this.auditId,
//     required this.auditEntityName,
//     required this.auditEntityTypeId,
//     required this.auditParentEntityId,
//     required this.sequenceNo,
//     this.entityEndDate,
//     required this.isLeafNode,
//     this.barcodeNFC,
//     required this.entityLevel,
//     this.entityException,
//     this.scheduleOccurrenceIds,
//   });
//   late final int auditEntityId;
//   late final int auditId;
//   late final String auditEntityName;
//   late final int auditEntityTypeId;
//   late final int auditParentEntityId;
//   late final int sequenceNo;
//   late final String? entityEndDate;
//   late final bool isLeafNode;
//   late final String? barcodeNFC;
//   late final int entityLevel;
//   late final bool? entityException;
//   late final String? scheduleOccurrenceIds;

//   AuditEntityModel.fromJson(Map<String, dynamic> json) {
//     auditEntityId = json['AuditEntityId'];
//     auditId = json['AuditId'];
//     auditEntityName = json['AuditEntityName'];
//     auditEntityTypeId = json['AuditEntityTypeId'];
//     auditParentEntityId = json['AuditParentEntityId'];
//     sequenceNo = json['SequenceNo'];
//     entityEndDate = null;
//     isLeafNode = json['IsLeafNode'];
//     barcodeNFC = null;
//     entityLevel = json['EntityLevel'];
//     entityException = null;
//     scheduleOccurrenceIds = null;
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['AuditEntityId'] = auditEntityId;
//     _data['AuditId'] = auditId;
//     _data['AuditEntityName'] = auditEntityName;
//     _data['AuditEntityTypeId'] = auditEntityTypeId;
//     _data['AuditParentEntityId'] = auditParentEntityId;
//     _data['SequenceNo'] = sequenceNo;
//     _data['EntityEndDate'] = entityEndDate;
//     _data['IsLeafNode'] = isLeafNode;
//     _data['BarcodeNFC'] = barcodeNFC;
//     _data['EntityLevel'] = entityLevel;
//     _data['EntityException'] = entityException;
//     _data['ScheduleOccurrenceIds'] = scheduleOccurrenceIds;
//     return _data;
//   }
// }
