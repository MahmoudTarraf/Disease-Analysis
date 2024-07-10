import 'package:disease_analysis/view/helper/special_app_bar_helper.dart';
import 'package:disease_analysis/view/screens/frequent_patterns/frequent_patterns_steps.dart';
import 'package:disease_analysis/view/screens/frequent_patterns/texts.dart';
import 'package:flutter/material.dart';

class FrequentPatternsResults extends StatelessWidget {
  final int rows;
  final int columns;
  final int minConfidence;
  final int minSupport;
  final int supportCount;
  final Map result;
  const FrequentPatternsResults({
    super.key,
    required this.columns,
    required this.rows,
    required this.minConfidence,
    required this.minSupport,
    required this.supportCount,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final len = result["final_result"][0] as List;
    final List strongList = result["strong_itemsets"];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpecialAppBarHelper(
              name: 'Frequent Patterns Results',
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
            rowCreator(
              "Columns Number : ",
              columns.toString(),
            ),
            rowCreator(
              "Rows Number : ",
              rows.toString(),
            ),
            rowCreator(
              "Minimum Support : ",
              minSupport.toString(),
            ),
            rowCreator(
              "Minimum Confidence : ",
              minConfidence.toString(),
            ),
            rowCreator(
              "Support Count : ",
              supportCount.toString(),
            ),
            getText(len.length),
            SizedBox(
              height: 120,
              child: Center(child: getListView(result["final_result"])),
            ),
            getRules(
              rules: result["final_rules"],
              name: 'Association Rules : ',
            ),
            supportListgene(
                supportList: result["supported_list"],
                name: "Support For Association Rules :"),
            supportListgene(
                supportList: result["confident_list"],
                name: "Confidence For Association Rules :"),
            strongList.isEmpty
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Strong Rules : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "No Strong Rules Found !!!",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                : supportListgene(
                    supportList: result["strong_itemsets"],
                    name: "Strong Rules :"),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
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
                        builder: (context) => const FrequentPatternsSteps(),
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
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

Widget rowCreator(String name, String value) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            name,
            style: const TextStyle(
                color: Color.fromARGB(255, 31, 92, 33),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
