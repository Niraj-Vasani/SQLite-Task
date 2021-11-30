part of 'audit_entity_cubit.dart';

abstract class AuditEntityState extends Equatable {
  const AuditEntityState();

  @override
  List<Object> get props => [];
}

class AuditEntityInitial extends AuditEntityState {}

class AuditEntityLoading extends AuditEntityState {}

class AuditEntityLoaded extends AuditEntityState {
  final List<AuditEntityModel> auditEntityData;

  AuditEntityLoaded({required this.auditEntityData});

  @override
  List<Object> get props => [auditEntityData];
}

class AuditEntityError extends AuditEntityState {
  final errorMsg;

  AuditEntityError({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
