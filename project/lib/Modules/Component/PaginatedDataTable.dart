import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Data/data_test.dart';
// import 'package:ku_t/Modules/provider/provider_test.dart';
// import 'package:provider/provider.dart';

class PaginatedTable extends StatefulWidget {
  const PaginatedTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaginatedTableState createState() => _PaginatedTableState();
}

class _PaginatedTableState extends State<PaginatedTable> {
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
    const DataColumn(
        label: Text('จัดการรายวิชา',
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
            source: MyDataSource(data, onEdit: editRow, onDelete: deleteRow),
            rowsPerPage: 10,
            headingRowHeight: 42,
            dataRowHeight: 38,
          ),
        ),
      ],
    );
  }

  // Function to add a new row
  void addRow(Map<String, dynamic> newRow) {
    setState(() {
      data.add(newRow);
    });
  }

  // Function to edit an existing row
  void editRow(int index, Map<String, dynamic> newData) {
    // final itemProvider = Provider.of<ItemProvider>(context, listen: false);

    // final itemToEdit = itemProvider.data[index];

    // TextEditingController idController =
    //     TextEditingController(text: itemToEdit.id);
    // TextEditingController nameSubController =
    //     TextEditingController(text: itemToEdit.name_subject);
    // TextEditingController creditController =
    //     TextEditingController(text: itemToEdit.credit);
    // TextEditingController preController =
    //     TextEditingController(text: itemToEdit.pre);
    // setState(() {
    //   data[index] = newData;
    // });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('แก้ไขรายวิชา'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                // controller: idController,
                decoration: InputDecoration(labelText: 'รหัสวิชา'),
              ),
              TextField(
                // controller: nameSubController,
                decoration: InputDecoration(labelText: 'ชื่อรายวิชา'),
              ),
              TextField(
                // controller: creditController,
                decoration: InputDecoration(labelText: 'หน่วยกิต'),
              ),
              TextField(
                // controller: preController,
                decoration: InputDecoration(labelText: 'วิชาพื้นฐาน'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                // final newItem = Item(
                //   name: nameController.text,
                //   description: descriptionController.text,
                // );
                // itemProvider.editItem(index, newItem);
                Navigator.of(context).pop();
              },
              child: Text('บันทึก'),
            ),
          ],
        );
      },
    );
  }

  // Function to delete a row
  void deleteRow(int index) {
    // final itemProvider = Provider.of<ItemProvider>(context, listen: false);
    // setState(() {
    //   data.removeAt(index);
    // });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ลบรายวิชา'),
          content: Text('คุณต้องการลบรายวิชาใช่หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                // itemProvider.removeItem(index);
                data.removeAt(index);
                Navigator.of(context).pop();
              },
              child: Text('ยืนยัน'),
            ),
          ],
        );
      },
    );
  }
}

class MyDataSource extends DataTableSource {
  final List<Map<String, dynamic>> data;
  final Function(int index, Map<String, dynamic> newData) onEdit;
  final Function(int index) onDelete;

  MyDataSource(this.data, {required this.onEdit, required this.onDelete});

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
        DataCell(Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Color.fromRGBO(112, 112, 112, 1),
              onPressed: () {
                // Edit action
                onEdit(index, rowData);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Color.fromRGBO(112, 112, 112, 1),
              onPressed: () {
                // Delete action
                onDelete(index);
              },
            ),
          ],
        )),
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
