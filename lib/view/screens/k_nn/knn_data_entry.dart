// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:disease_analysis/view/helper/app_bar_helper.dart';
import 'package:disease_analysis/controller/text_form_fields/column_number.dart';
import 'package:disease_analysis/controller/knn_controller/knn_controller.dart';
import 'package:disease_analysis/controller/text_form_fields/k_number.dart';
import 'package:disease_analysis/controller/messages.dart';
import 'package:disease_analysis/controller/text_form_fields/row_number.dart';
import 'package:disease_analysis/view/screens/k_nn/knn_input_values.dart';
import 'package:flutter/material.dart';

class KnnScreen extends StatefulWidget {
  const KnnScreen({super.key});

  @override
  State<KnnScreen> createState() => _KnnScreenState();
}

class _KnnScreenState extends State<KnnScreen> {
  int _columnNumber = 0;
  int _rowNumber = 0;
  int _kNumber = 0;
  void setKNumber(String val) {
    _kNumber = int.parse(val);
  }

  void setColumnNumber(String val) {
    _columnNumber = int.parse(val);
  }

  void setRowNumber(String vals) {
    _rowNumber = int.parse(vals);
  }

  Future<void> _validateThis() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    var columnList = await getColumnsNames(
      colNumber: _columnNumber,
      context: context,
    );
    if (columnList.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => KnnInputValues(
            numColumns: _columnNumber,
            numRows: _rowNumber,
            columnNames: columnList,
            thisKNumber: _kNumber,
          ),
        ),
      );
    } else {
      warningMessage(
        context: context,
        message: 'List is Empty!',
      );
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const AppBarHelper(
                  name: "K-NN Algorithm",
                  color: Colors.black,
                  size: 24,
                ),
                ColumnNumber(columnHandler: setColumnNumber),
                RowNumber(rowHandler: setRowNumber),
                KNumber(kHandler: setKNumber),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                    style: const ButtonStyle().copyWith(
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(15)),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {
                      _validateThis();
                    },
                    child: const Text(
                      "Get Data",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
