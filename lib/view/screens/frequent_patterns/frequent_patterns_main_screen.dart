// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:disease_analysis/view/helper/app_bar_helper.dart';
import 'package:disease_analysis/controller/text_form_fields/column_number.dart';
import 'package:disease_analysis/controller/text_form_fields/row_number.dart';
import 'package:disease_analysis/view/screens/frequent_patterns/frequent_patterns_sup_conf_screen.dart';
import 'package:disease_analysis/view/screens/frequent_patterns/texts.dart';
import 'package:flutter/material.dart';

class FrequentPatternsMainScreen extends StatefulWidget {
  const FrequentPatternsMainScreen({super.key});

  @override
  State<FrequentPatternsMainScreen> createState() =>
      FrequentPatternsMainScreenState();
}

class FrequentPatternsMainScreenState
    extends State<FrequentPatternsMainScreen> {
  int _columnNumber = 0;
  int _rowNumber = 0;

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FrequentPatternsSupConfScreen(
          columns: _columnNumber,
          rows: _rowNumber,
        ),
      ),
    );
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
                  name: "Frequent-Patterns Algorithm",
                  color: Colors.black,
                  size: 24,
                ),
                getNamesMain(),
                ColumnNumber(columnHandler: setColumnNumber),
                RowNumber(rowHandler: setRowNumber),
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
                      "Next Step",
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
