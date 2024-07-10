import 'package:csv/csv.dart';
import 'package:disease_analysis/view/helper/special_app_bar_helper.dart';
import 'package:disease_analysis/view/screens/dataset/datatable_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DatasetReadScreen extends StatefulWidget {
  const DatasetReadScreen({super.key});

  @override
  State<DatasetReadScreen> createState() => _DatasetReadScreenState();
}

class _DatasetReadScreenState extends State<DatasetReadScreen> {
  List<List<dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _loadCsv();
  }

  void _loadCsv() async {
    final rowData = await rootBundle.loadString("assets/Training.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rowData);

    setState(() {
      _data = listData;
      condition = true;
    });
  }

  var condition = false;
  List<List> getValueLists() {
    List<List> thisItem = [];
    if (_data.isNotEmpty) {
      for (int i = 1; i < 30; i++) {
        thisItem.add(_data[i]);
      }
    }
    return thisItem;
  }

  @override
  Widget build(BuildContext context) {
    final valueList = getValueLists();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SpecialAppBarHelper(name: 'Available Dataset', val: 24),
            _data.isEmpty
                ? Container()
                : DatatableScreen(columns: _data[0], values: valueList),
          ],
        ),
      ),
    );
  }
}
