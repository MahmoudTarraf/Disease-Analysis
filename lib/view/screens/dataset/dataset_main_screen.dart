import 'dart:math';

import 'package:disease_analysis/controller/knn_controller/knn_controller.dart';
import 'package:disease_analysis/controller/text_form_fields/index_remove_row.dart';
import 'package:disease_analysis/view/helper/app_bar_helper.dart';
import 'package:disease_analysis/view/helper/knn_steps_texts.dart';
import 'package:disease_analysis/view/screens/k_nn/knn_newdata_database_screen.dart';
import 'package:disease_analysis/view/screens/dataset/dataset_read_screen.dart';
import 'package:flutter/material.dart';

class DatasetScreen extends StatefulWidget {
  const DatasetScreen({super.key});

  @override
  State<DatasetScreen> createState() => _DatasetScreenState();
}

class _DatasetScreenState extends State<DatasetScreen> {
  List<String> generateList() {
    List<String> valueList = [];
    final random = Random();
    valueList = List<String>.generate(132, (_) => random.nextInt(2).toString());
    return valueList;
  }

  int _thisIndex = 0;
  var condition = false;

  void setIndex(String val) {
    _thisIndex = int.parse(val);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final columns = [
      'itching',
      'skin_rash',
      'nodal_skin_eruptions',
      'continuous_sneezing',
      'shivering',
      'chills',
      'Progonosis',
    ];
    final values = [0, 0, 0, 1, 0, 1, 0];
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarHelper(
                  name: 'Dataset',
                  color: Colors.pink,
                  size: 30,
                ),
                getDatasetMsg(),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Example:',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 3,
                ),
                KnnNewDataDatabaseScreen(
                  columns: columns,
                  values: values,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 3,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: ElevatedButton(
                      style: const ButtonStyle().copyWith(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(15)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DatasetReadScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Read Dataset",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(
                      style: const ButtonStyle().copyWith(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(15)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black),
                      ),
                      onPressed: () async {
                        List<String> tempList = generateList();
                        await addRow(newData: tempList, context: context);
                      },
                      child: const Text(
                        "Add Row",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: condition,
                  child: IndexRemoveRow(
                    indexRemoveHandler: setIndex,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(
                      style: const ButtonStyle().copyWith(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(15)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black),
                      ),
                      onPressed: () async {
                        if (condition == false) {
                          setState(() {
                            condition = true;
                          });
                        } else {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          await removeRow(index: _thisIndex, context: context);
                        }
                      },
                      child: const Text(
                        "Remove Row",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
