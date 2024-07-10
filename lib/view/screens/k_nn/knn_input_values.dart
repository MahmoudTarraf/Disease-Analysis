// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:math';

import 'package:disease_analysis/controller/knn_controller/knn_controller.dart';
import 'package:disease_analysis/controller/messages.dart';
import 'package:disease_analysis/controller/value_for_column.dart';
import 'package:disease_analysis/view/screens/k_nn/knn_results.dart';
import 'package:disease_analysis/view/helper/special_app_bar_helper.dart';
import 'package:flutter/material.dart';

class KnnInputValues extends StatefulWidget {
  final int numColumns;
  final int numRows;
  final int thisKNumber;
  final List<String> columnNames;
  const KnnInputValues({
    super.key,
    required this.numColumns,
    required this.numRows,
    required this.thisKNumber,
    required this.columnNames,
  });

  @override
  State<KnnInputValues> createState() => _KnnInputValuesState();
}

class _KnnInputValuesState extends State<KnnInputValues> {
  List<int> valueList = [];
  var condition = true;
  void setValueList(String value) {
    valueList.add(int.parse(value));
  }

  void generateRandomList(int length) async {
    valueList = [];
    final random = Random();
    valueList = List<int>.generate(length, (_) => random.nextInt(2));
    final newData = createMapFromLists(widget.columnNames, valueList);
    final expectedDiseases = await getTargetClass(context: context);
    await knnAlgorithm(
      columnNumber: widget.numColumns,
      rowNumber: widget.numRows,
      kNumber: widget.thisKNumber,
      newData: newData,
      context: context,
    ).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => KnnResults(
            thisKNumber: widget.thisKNumber,
            newData: newData,
            columnNames: widget.columnNames,
            valueList: valueList,
            rowNumber: widget.numRows,
            expectedDiseases: expectedDiseases,
          ),
        ),
      ),
    );
  }

  Future<void> _validateThis() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (condition == true) {
      _formKey.currentState!.save();
      condition = false;
    } else {
      warningMessage(
        context: context,
        message: 'Values already set, Press Reset Fields!',
      );
      return;
    }
    final newData = createMapFromLists(widget.columnNames, valueList);
    final expectedDiseases = await getTargetClass(context: context);
    await knnAlgorithm(
      columnNumber: widget.numColumns,
      rowNumber: widget.numRows,
      kNumber: widget.thisKNumber,
      newData: newData,
      context: context,
    ).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => KnnResults(
            thisKNumber: widget.thisKNumber,
            newData: newData,
            columnNames: widget.columnNames,
            valueList: valueList,
            rowNumber: widget.numRows,
            expectedDiseases: expectedDiseases,
          ),
        ),
      ),
    );
  }

  void _resetValues() {
    _formKey.currentState!.reset(); // Access form state and call reset()
    valueList = [];
    condition = true;
  }

  Map<String, int> createMapFromLists(
      List<String> listOfColumns, List<int> listOfValues) {
    Map<String, int> temp = {};
    for (int i = 0; i < listOfColumns.length; i++) {
      temp[listOfColumns[i]] = listOfValues[i];
    }
    return temp;
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
                SpecialAppBarHelper(
                  name: "K-NN Algorithm",
                  val: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 600,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        String thisItem = widget.columnNames[index];
                        return ValueForColumn(
                          valueForColumnHandler: setValueList,
                          name: thisItem,
                        );
                      },
                      itemCount: widget.columnNames.length,
                    ),
                  ),
                ),
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
                      _resetValues();
                    },
                    child: const Text(
                      "Reset Fields",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
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
                      "Verify And Calculate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 5,
                  color: Colors.black,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Too much Values to fill ?',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 50),
                  child: ElevatedButton(
                    style: const ButtonStyle().copyWith(
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(15)),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {
                      generateRandomList(widget.columnNames.length);
                    },
                    child: const Text(
                      "Generate Random Values",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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

// Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Checkbox(
//                                       checkColor: Colors.pink,
//                                       fillColor: const MaterialStatePropertyAll(
//                                           Colors.white),
//                                       value: rememberMe,
//                                       onChanged: (val) {
//                                         setState(() {
//                                           rememberMe = val;
//                                         });
//                                       },
//                                     ),
//                                     Text(
//                                       AppLocalizations.of(context)!.remember_me,
//                                       style: const TextStyle(
//                                         color: Colors.pink,
//                                         fontSize: 22,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
