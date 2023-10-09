import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Data/data_test.dart';
// import 'package:ku_t/Modules/provider/provider_tast.dart';
// import 'package:ku_t/Modules/provider/provider.dart';
// import 'package:ku_t/Modules/Model/dataTest.dart';
// import 'package:ku_t/Modules/provider/provider_test.dart';
// import 'package:provider/provider.dart';

class PaginatedTableProcess extends StatefulWidget {
  const PaginatedTableProcess({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaginatedTableProcessState createState() => _PaginatedTableProcessState();
}

class _PaginatedTableProcessState extends State<PaginatedTableProcess> {
  // List<Map<String, dynamic>> data = [
  //   {'id': 1, 'name': 'John', 'age': 30},
  //   {'id': 2, 'name': 'Alice', 'age': 25},
  //   // Add more data as needed.
  // ];

  final columns = [
    const DataColumn(
        label: Text('รหัสวิชา',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
    const DataColumn(
        label: Text('ชื่อรายวิชา',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
    const DataColumn(
        label: Text('หน่วยกิต',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
    const DataColumn(
        label: Text('วิชาพื้นฐาน',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: PaginatedDataTable(
            // header: Text('My Data Table'),
            columns: columns,
            source: MyDataSource(data),
            rowsPerPage: 10,
            headingRowHeight: 42,
            dataRowHeight: 38,
          ),
        ),
      ],
    );
  }
}

class MyDataSource extends DataTableSource {
  final List<Map<String, dynamic>> data;

  MyDataSource(this.data);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    final rowData = data[index];
    return DataRow(
      cells: [
        DataCell(Text(rowData['id'].toString())),
        DataCell(Text(rowData['name_subject'].toString())),
        DataCell(Text(rowData['credit'].toString())),
        DataCell(Text(rowData['pre'].toString())),
      ],
    );
  }

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
