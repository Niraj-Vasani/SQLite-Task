// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_entity_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Audit extends DataClass implements Insertable<Audit> {
  final int auditEntityId;
  final String auditEntityName;
  final DateTime? entityEndDate;
  Audit(
      {required this.auditEntityId,
      required this.auditEntityName,
      this.entityEndDate});
  factory Audit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Audit(
      auditEntityId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audit_entity_id'])!,
      auditEntityName: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}audit_entity_name'])!,
      entityEndDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}entity_end_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['audit_entity_id'] = Variable<int>(auditEntityId);
    map['audit_entity_name'] = Variable<String>(auditEntityName);
    if (!nullToAbsent || entityEndDate != null) {
      map['entity_end_date'] = Variable<DateTime?>(entityEndDate);
    }
    return map;
  }

  AuditsCompanion toCompanion(bool nullToAbsent) {
    return AuditsCompanion(
      auditEntityId: Value(auditEntityId),
      auditEntityName: Value(auditEntityName),
      entityEndDate: entityEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(entityEndDate),
    );
  }

  factory Audit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Audit(
      auditEntityId: serializer.fromJson<int>(json['auditEntityId']),
      auditEntityName: serializer.fromJson<String>(json['auditEntityName']),
      entityEndDate: serializer.fromJson<DateTime?>(json['entityEndDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'auditEntityId': serializer.toJson<int>(auditEntityId),
      'auditEntityName': serializer.toJson<String>(auditEntityName),
      'entityEndDate': serializer.toJson<DateTime?>(entityEndDate),
    };
  }

  Audit copyWith(
          {int? auditEntityId,
          String? auditEntityName,
          DateTime? entityEndDate}) =>
      Audit(
        auditEntityId: auditEntityId ?? this.auditEntityId,
        auditEntityName: auditEntityName ?? this.auditEntityName,
        entityEndDate: entityEndDate ?? this.entityEndDate,
      );
  @override
  String toString() {
    return (StringBuffer('Audit(')
          ..write('auditEntityId: $auditEntityId, ')
          ..write('auditEntityName: $auditEntityName, ')
          ..write('entityEndDate: $entityEndDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(auditEntityId.hashCode,
      $mrjc(auditEntityName.hashCode, entityEndDate.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Audit &&
          other.auditEntityId == this.auditEntityId &&
          other.auditEntityName == this.auditEntityName &&
          other.entityEndDate == this.entityEndDate);
}

class AuditsCompanion extends UpdateCompanion<Audit> {
  final Value<int> auditEntityId;
  final Value<String> auditEntityName;
  final Value<DateTime?> entityEndDate;
  const AuditsCompanion({
    this.auditEntityId = const Value.absent(),
    this.auditEntityName = const Value.absent(),
    this.entityEndDate = const Value.absent(),
  });
  AuditsCompanion.insert({
    this.auditEntityId = const Value.absent(),
    required String auditEntityName,
    this.entityEndDate = const Value.absent(),
  }) : auditEntityName = Value(auditEntityName);
  static Insertable<Audit> custom({
    Expression<int>? auditEntityId,
    Expression<String>? auditEntityName,
    Expression<DateTime?>? entityEndDate,
  }) {
    return RawValuesInsertable({
      if (auditEntityId != null) 'audit_entity_id': auditEntityId,
      if (auditEntityName != null) 'audit_entity_name': auditEntityName,
      if (entityEndDate != null) 'entity_end_date': entityEndDate,
    });
  }

  AuditsCompanion copyWith(
      {Value<int>? auditEntityId,
      Value<String>? auditEntityName,
      Value<DateTime?>? entityEndDate}) {
    return AuditsCompanion(
      auditEntityId: auditEntityId ?? this.auditEntityId,
      auditEntityName: auditEntityName ?? this.auditEntityName,
      entityEndDate: entityEndDate ?? this.entityEndDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (auditEntityId.present) {
      map['audit_entity_id'] = Variable<int>(auditEntityId.value);
    }
    if (auditEntityName.present) {
      map['audit_entity_name'] = Variable<String>(auditEntityName.value);
    }
    if (entityEndDate.present) {
      map['entity_end_date'] = Variable<DateTime?>(entityEndDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditsCompanion(')
          ..write('auditEntityId: $auditEntityId, ')
          ..write('auditEntityName: $auditEntityName, ')
          ..write('entityEndDate: $entityEndDate')
          ..write(')'))
        .toString();
  }
}

class $AuditsTable extends Audits with TableInfo<$AuditsTable, Audit> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AuditsTable(this._db, [this._alias]);
  final VerificationMeta _auditEntityIdMeta =
      const VerificationMeta('auditEntityId');
  late final GeneratedColumn<int?> auditEntityId = GeneratedColumn<int?>(
      'audit_entity_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _auditEntityNameMeta =
      const VerificationMeta('auditEntityName');
  late final GeneratedColumn<String?> auditEntityName =
      GeneratedColumn<String?>('audit_entity_name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 50),
          typeName: 'TEXT',
          requiredDuringInsert: true);
  final VerificationMeta _entityEndDateMeta =
      const VerificationMeta('entityEndDate');
  late final GeneratedColumn<DateTime?> entityEndDate =
      GeneratedColumn<DateTime?>('entity_end_date', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [auditEntityId, auditEntityName, entityEndDate];
  @override
  String get aliasedName => _alias ?? 'audits';
  @override
  String get actualTableName => 'audits';
  @override
  VerificationContext validateIntegrity(Insertable<Audit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('audit_entity_id')) {
      context.handle(
          _auditEntityIdMeta,
          auditEntityId.isAcceptableOrUnknown(
              data['audit_entity_id']!, _auditEntityIdMeta));
    }
    if (data.containsKey('audit_entity_name')) {
      context.handle(
          _auditEntityNameMeta,
          auditEntityName.isAcceptableOrUnknown(
              data['audit_entity_name']!, _auditEntityNameMeta));
    } else if (isInserting) {
      context.missing(_auditEntityNameMeta);
    }
    if (data.containsKey('entity_end_date')) {
      context.handle(
          _entityEndDateMeta,
          entityEndDate.isAcceptableOrUnknown(
              data['entity_end_date']!, _entityEndDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditEntityId};
  @override
  Audit map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Audit.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AuditsTable createAlias(String alias) {
    return $AuditsTable(_db, alias);
  }
}

abstract class _$AuditDatabase extends GeneratedDatabase {
  _$AuditDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AuditsTable audits = $AuditsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [audits];
}
