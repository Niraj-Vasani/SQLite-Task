import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../data/models/audit_entity_model.dart';
import 'dialogs.dart';

Widget buildAuditEntityListView(
    List<AuditEntityModel> dataList, BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (_, index) {
            final itemData = dataList[index];
            return _buildListItem(itemData);
          },
        ),
      ),
    ],
  );
}

Widget _buildListItem(AuditEntityModel itemData) {
  return Slidable(
    endActionPane: ActionPane(
      motion: DrawerMotion(),
      children: [
        SlidableAction(
          label: 'Edit',
          backgroundColor: Colors.green,
          icon: Icons.edit,
          foregroundColor: Colors.white,
          onPressed: (context) => displayEditDialog(context, itemData),
        ),
        SlidableAction(
          label: 'Delete',
          backgroundColor: Colors.red,
          icon: Icons.delete,
          foregroundColor: Colors.white,
          onPressed: (context) => displayDeleteDialog(context, itemData),
        ),
      ],
    ),
    child: ListTile(
      title: Text(itemData.auditEntityName.toString()),
      subtitle: Text(itemData.entityEndDate?.toString() ?? "No Date"),
    ),
  );
}
