import 'package:flutter/material.dart';

class DatatableScreen extends StatelessWidget {
  final List<dynamic> columns;
  final List<List> values;
  const DatatableScreen({
    super.key,
    required this.columns,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    var temp = _buildRows(values);
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: _buildColumns(columns),
              rows: temp,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: Text(
                '4920 Rows....',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataColumn> _buildColumns(List<dynamic> columns) {
    return columns
        .map(
          (column) => DataColumn(
            label: Text(
              column,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        )
        .toList();
  }

  List<DataRow> _buildRows(List<List<dynamic>> data) {
    return data
        .map((row) => DataRow(
              cells:
                  row.map((value) => DataCell(Text(value.toString()))).toList(),
            ))
        .toList();
  }
}
