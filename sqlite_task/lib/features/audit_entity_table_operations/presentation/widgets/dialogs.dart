import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/audit_entity_model.dart';
import '../cubit/audit_entity_cubit.dart';

displayEditDialog(BuildContext context, AuditEntityModel itemData) async {
  TextEditingController _auditTitleController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Edit Entity Title"),
        content: TextField(
          controller: _auditTitleController,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(hintText: "Enter Audit Name"),
        ),
        actions: [
          ElevatedButton(
            child: const Text('Confirm'),
            onPressed: () {
              var title = _auditTitleController.text.trim();
              if (title.isNotEmpty) {
                BlocProvider.of<AuditEntityCubit>(context)
                    .editAuditEntitydata(
                      AuditEntityModel(
                        auditEntityId: itemData.auditEntityId,
                        auditEntityName: title,
                      ),
                    )
                    .whenComplete(() => _goBackToHomePage(context));
              }
            },
          ),
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              _goBackToHomePage(context);
            },
          )
        ],
      );
    },
  );
}

displayDeleteDialog(BuildContext context, AuditEntityModel itemData) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Delete Audit Entry!!"),
        content: const Text("Do you want to Delete This Record ?"),
        actions: [
          ElevatedButton(
            child: const Text('Delete'),
            onPressed: () {
              BlocProvider.of<AuditEntityCubit>(context)
                  .deleteAuditEntity(itemData)
                  .whenComplete(() => _goBackToHomePage(context));
            },
          ),
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              _goBackToHomePage(context);
            },
          )
        ],
      );
    },
  );
}

_goBackToHomePage(BuildContext context) {
  Navigator.of(context).pop();
}
