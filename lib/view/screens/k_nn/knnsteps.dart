import 'package:disease_analysis/controller/knn_controller/knn_controller.dart';
import 'package:disease_analysis/view/screens/k_nn/knn_newdata_database_screen.dart';
import 'package:disease_analysis/view/helper/special_app_bar_helper.dart';
import 'package:disease_analysis/view/helper/knn_steps_texts.dart';
import 'package:flutter/material.dart';

class KnnSteps extends StatelessWidget {
  final List<String> columnNames;
  final List<int> valueList;
  final int kNumber;
  const KnnSteps({
    super.key,
    required this.columnNames,
    required this.valueList,
    required this.kNumber,
  });

  @override
  Widget build(BuildContext context) {
    final resultsMap = getknnResultMap;
    final List thisList = resultsMap["distances"];
    thisList.sort();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpecialAppBarHelper(
              name: 'K-NN Steps',
              val: 24,
            ),
            getFirstStep(),
            const Divider(
              color: Colors.black,
              thickness: 3,
            ),
            KnnNewDataDatabaseScreen(
              columns: columnNames,
              values: valueList,
            ),
            const Divider(
              color: Colors.black,
              thickness: 3,
            ),
            getSecondStep(),
            rowCreator(
              'K Number: ',
              kNumber.toString(),
            ),
            getThirdStep(),
            rowCreator(
              'Distances: ',
              resultsMap["distances"].toString(),
            ),
            getForthStep(),
            rowCreator(
              'Ranks Based on k: ',
              thisList.toString(),
            ),
            getFifthStep(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: getDisease(),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

Widget rowCreator(String title, String value) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.pink,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
