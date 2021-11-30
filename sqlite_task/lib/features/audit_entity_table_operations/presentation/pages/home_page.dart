import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/audit_entity_cubit.dart';
import '../widgets/audit_entity_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Audit Entries"),
          centerTitle: true,
        ),
        body: BlocBuilder<AuditEntityCubit, AuditEntityState>(
          builder: (context, state) {
            if (state is AuditEntityInitial) {
              BlocProvider.of<AuditEntityCubit>(context).getAuditEntityDatas();
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              );
            } else if (state is AuditEntityLoading) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              );
            } else if (state is AuditEntityError) {
              return Center(
                child: Text("Failed to load the data"),
              );
            } else if (state is AuditEntityLoaded) {
              return buildAuditEntityListView(state.auditEntityData, context);
            }
            return Center(child: Text("Something went wrong!"));
          },
        ),
      ),
    );
  }
}
