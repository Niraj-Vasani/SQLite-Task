import 'package:equatable/equatable.dart';

class AuditEntity extends Equatable {
  late final int auditEntityId;
  late final int? auditId;
  late final String auditEntityName;
  late final int? auditEntityTypeId;
  late final int? auditParentEntityId;
  late final int? sequenceNo;
  late final String? entityEndDate;
  late final bool? isLeafNode;
  late final String? barcodeNFC;
  late final int? entityLevel;
  late final bool? entityException;
  late final String? scheduleOccurrenceIds;

  AuditEntity({
    required this.auditEntityId,
    this.auditId,
    required this.auditEntityName,
    this.auditEntityTypeId,
    this.auditParentEntityId,
    this.sequenceNo,
    this.entityEndDate,
    this.isLeafNode,
    this.barcodeNFC,
    this.entityLevel,
    this.entityException,
    this.scheduleOccurrenceIds,
  });

  // AuditEntity.fromJson(Map<String, dynamic> json) {
  //   auditEntityId = json['AuditEntityId'];
  //   auditId = json['AuditId'];
  //   auditEntityName = json['AuditEntityName'];
  //   auditEntityTypeId = json['AuditEntityTypeId'];
  //   auditParentEntityId = json['AuditParentEntityId'];
  //   sequenceNo = json['SequenceNo'];
  //   entityEndDate = null;
  //   isLeafNode = json['IsLeafNode'];
  //   barcodeNFC = null;
  //   entityLevel = json['EntityLevel'];
  //   entityException = null;
  //   scheduleOccurrenceIds = null;
  // }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['AuditEntityId'] = auditEntityId;
  //   _data['AuditId'] = auditId;
  //   _data['AuditEntityName'] = auditEntityName;
  //   _data['AuditEntityTypeId'] = auditEntityTypeId;
  //   _data['AuditParentEntityId'] = auditParentEntityId;
  //   _data['SequenceNo'] = sequenceNo;
  //   _data['EntityEndDate'] = entityEndDate;
  //   _data['IsLeafNode'] = isLeafNode;
  //   _data['BarcodeNFC'] = barcodeNFC;
  //   _data['EntityLevel'] = entityLevel;
  //   _data['EntityException'] = entityException;
  //   _data['ScheduleOccurrenceIds'] = scheduleOccurrenceIds;
  //   return _data;
  // }

  @override
  List<Object?> get props => [
        auditEntityId,
        auditId,
        auditEntityName,
        auditEntityTypeId,
        auditParentEntityId,
        sequenceNo,
        entityEndDate,
        isLeafNode,
        barcodeNFC,
        entityLevel,
        entityException,
        scheduleOccurrenceIds
      ];
}
