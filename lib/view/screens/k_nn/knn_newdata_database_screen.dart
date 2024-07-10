import 'package:flutter/material.dart';

class KnnNewDataDatabaseScreen extends StatelessWidget {
  final List<String> columns;
  final List<int> values;
  const KnnNewDataDatabaseScreen({
    super.key,
    required this.columns,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    var temp = _buildRows(columns, values);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: _buildColumns(columns),
        rows: [temp[0]],
      ),
    );
  }

  List<DataColumn> _buildColumns(List<String> columns) {
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

  List<DataRow> _buildRows(List<String> columns, List<int> values) {
    return values
        .map((_) => DataRow(
            cells: values.map((e) => DataCell(Text(e.toString()))).toList()))
        .toList();
  }
}
