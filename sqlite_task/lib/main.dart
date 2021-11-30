import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/audit_entity_table_operations/presentation/cubit/audit_entity_cubit.dart';
import 'features/audit_entity_table_operations/presentation/pages/home_page.dart';

import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuditEntityCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SQLite app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
