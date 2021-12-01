import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:sqlite_task/features/audit_entity_table_operations/domain/usecases/watch_audit_entity.dart';
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
  final WatchAuditEntity watchAuditEntityUsecase;
  final GetAuditEntity getAuditEntityUsecase;
  final EditAuditEntity editAuditEntityUsecase;
  final DeleteAuditEntity deleteAuditEntityUsecase;
  final InsertAuditEntity insertAuditEntityUsecase;
  final AddAuditEntityJsonIntoDb addAuditEntityJsonIntoDbUsecase;

  AuditEntityCubit({
    required this.watchAuditEntityUsecase,
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
      print(result);
      result!.asStream().listen((enityData) async {
        print(12);
        print(enityData);
        enityData!.fold(
          (failure) => emit(AuditEntityError(errorMsg: _mapFailureToMessage)),
          (list) async {
            print(list);
            if (list.length == 0) {
              print("is 0");
              final jsonData =
                  await rootBundle.loadString("assets/entity.json");
              final Map<String, dynamic> map = json.decode(jsonData);
              final List<dynamic> entityJsonList = map["auditEntity"];
              print(entityJsonList);
              var resultList = <AuditEntityModel>[];
              for (int i = 0; i < entityJsonList.length; i++) {
                var entity = AuditEntityModel(
                    auditEntityId: entityJsonList[i]["AuditEntityId"],
                    auditEntityName: entityJsonList[i]["AuditEntityName"],
                    entityEndDate: entityJsonList[i]["EntityEndDate"]);
                print(entity);
                resultList.add(entity);
              }
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
