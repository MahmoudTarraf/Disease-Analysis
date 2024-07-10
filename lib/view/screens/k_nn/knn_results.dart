import 'package:disease_analysis/view/screens/k_nn/knn_newdata_database_screen.dart';
import 'package:disease_analysis/view/screens/k_nn/knnsteps.dart';
import 'package:disease_analysis/view/helper/special_app_bar_helper.dart';
import 'package:disease_analysis/view/helper/knn_steps_texts.dart';
import 'package:flutter/material.dart';

class KnnResults extends StatelessWidget {
  final Map newData;
  final List<String> columnNames;
  final List<int> valueList;
  final int rowNumber;
  final List expectedDiseases;
  final int thisKNumber;
  const KnnResults({
    super.key,
    required this.newData,
    required this.columnNames,
    required this.valueList,
    required this.rowNumber,
    required this.expectedDiseases,
    required this.thisKNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpecialAppBarHelper(
              name: 'K-NN Results',
              val: 24,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'This is the data you entered:',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            KnnNewDataDatabaseScreen(
              columns: columnNames,
              values: valueList,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Expected Diseases :',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 210,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      String thisItem = expectedDiseases[index];
                      return Center(
                          child: Text(
                        thisItem,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ));
                    },
                    itemCount: expectedDiseases.length,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'K-NN Steps :',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  style: const ButtonStyle().copyWith(
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnnSteps(
                          columnNames: columnNames,
                          kNumber: thisKNumber,
                          valueList: valueList,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "See Steps!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
              child: Text(
                'K-NN Result After Search :',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            getDisease(),
          ],
        ),
      ),
    );
  }
}
