import 'package:disease_analysis/view/helper/special_app_bar_helper.dart';
import 'package:disease_analysis/view/screens/frequent_patterns/steps.dart';
import 'package:flutter/material.dart';

class FrequentPatternsSteps extends StatelessWidget {
  const FrequentPatternsSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpecialAppBarHelper(
              name: "Frequent Patterns Steps",
              val: 24,
            ),
            fpFirstStep(),
            fpSecondStep(),
            fpRulesStep(),
            fpSupportStep(),
            fpConfidenceStep(),
            fpStrongStep(),
            fpFinish(),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
