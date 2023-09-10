import 'package:flutter/material.dart';

// class นี้ เขียนเพื่อให้สามารถปรับแต่ง style ของ table ได้

class CustomDataTable extends StatelessWidget {
  // const CustomDataTable({super.key});

  final List<DataColumn> columns;
  final List<DataRow> rows;
  final double borderRadius;

  CustomDataTable({
    required this.columns,
    required this.rows,
    this.borderRadius = 0.0, // ค่าเริ่มต้นของขอบโค้ง
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: DataTable(
        dataRowHeight: 40,
        headingRowHeight: 40,
        headingRowColor: MaterialStateProperty.resolveWith(
          (states) => Color.fromRGBO(216, 236, 217, 1), // สีของ headingRow
        ),
        columns: columns,
        rows: rows,
      ),
    );
  }
}
