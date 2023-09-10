// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Componemt/TabAppBar.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/Import_Course.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/ManagerDashboard_View.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/Process_Import_Course.dart';
import 'package:ku_t/Modules/ManagerPage/ManagerImportPage.dart';
import 'package:ku_t/Modules/ManagerPage/Test.dart';

class ManagerPageRoute extends StatefulWidget {
  const ManagerPageRoute({super.key});

  @override
  State<ManagerPageRoute> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ManagerPageRoute> {
  String path = "Dashboard";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      initialRoute: '/',
      routes: {
        '/': (context) => _Page(() => const ManagerDashboard_View()),
        '/import': (context) => _Page(() => const ImportCourse()),
        '/importcourse': (context) => _Page(() => const ProcessImportCourse()),
      },
    );
    // if (path == "Import") {
    //   return _PageImport(() => const ManagerImportPage());
    // } else if (path == "Dashboard") {
    //   return _Page(() => const ManagerDashboard_View());
    // } else if (path == "Test") {
    //   return _Page(() => const Test());
    // } else
    //   return _Page(() => const ManagerDashboard_View());
  }

  Scaffold _Page(Widget Function() function) {
    return Scaffold(
      appBar: TabAppBar(),
      body: Column(
        children: [
          Row(),
          function(),
        ],
      ),
    );
  }

  Scaffold _PageImport(Widget Function() function) {
    return Scaffold(
      appBar: TabAppBar(),
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: (() {
              setState(() {
                path = "Dashboard";
                print(Path);
              });
            }),
            child: const Text("Dashboard"),
          ),
          function(),
        ],
      ),
    );
  }
}
