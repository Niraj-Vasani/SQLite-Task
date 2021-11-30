import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/audit_entity_model.dart';
import '../../domain/usecases/add_audit_entity_json_into_db.dart';
import '../../domain/usecases/delete_audit_entity.dart';
import '../../domain/usecases/edit_audit_entity.dart';
import '../../domain/usecases/get_audit_entity.dart';
import '../../domain/usecases/insert_audit_entity.dart';

part 'audit_entity_state.dart';

const String Local_FAILURE_MESSAGE = 'Local Failure';

class AuditEntityCubit extends Cubit<AuditEntityState> {
  final GetAuditEntity getAuditEntityUsecase;
  final EditAuditEntity editAuditEntityUsecase;
  final DeleteAuditEntity deleteAuditEntityUsecase;
  final InsertAuditEntity insertAuditEntityUsecase;
  final AddAuditEntityJsonIntoDb addAuditEntityJsonIntoDbUsecase;

  AuditEntityCubit({
    required this.getAuditEntityUsecase,
    required this.editAuditEntityUsecase,
    required this.deleteAuditEntityUsecase,
    required this.insertAuditEntityUsecase,
    required this.addAuditEntityJsonIntoDbUsecase,
  }) : super(AuditEntityInitial());

  getAuditEntityDatas() async {
    emit(AuditEntityLoading());

    try {
      final result = getAuditEntityUsecase.call(NoParams());
      result!.asStream().listen((enityData) async {
        enityData!.fold(
          (failure) => emit(AuditEntityError(errorMsg: _mapFailureToMessage)),
          (list) async {
            if (list.length == 0) {
              final jsonData =
                  await rootBundle.loadString("assets/entity.json");
              final Map<String, dynamic> map = json.decode(jsonData);
              final List<dynamic> list = map["auditEntity"];
              var resultList = <AuditEntityModel>[];
              list.forEach((element) {
                var entity = AuditEntityModel.fromJson(element);
                resultList.add(entity);
              });
              await addAuditEntityJsonIntoDbUsecase.call(resultList);
            } else {
              emit(
                AuditEntityLoaded(
                  auditEntityData: list as List<AuditEntityModel>,
                ),
              );
            }
          },
        );
      });
    } on Exception {
      emit(AuditEntityError(errorMsg: _mapFailureToMessage));
    }
  }

  editAuditEntitydata(AuditEntityModel entity) async {
    await editAuditEntityUsecase.call(entity);
  }

  deleteAuditEntity(AuditEntityModel entity) async {
    await deleteAuditEntityUsecase.call(entity);
  }

  insertAuditEntity(AuditEntityModel entity) async {
    await insertAuditEntityUsecase.call(entity);
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        return Local_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
