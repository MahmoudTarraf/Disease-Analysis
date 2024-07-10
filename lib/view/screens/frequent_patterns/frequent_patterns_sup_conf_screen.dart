// ignore_for_file: unused_field, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:disease_analysis/controller/frequent_patterns_controller/frequent_patterns_controller.dart';
import 'package:disease_analysis/controller/frequent_patterns_controller/min_conf.dart';
import 'package:disease_analysis/controller/frequent_patterns_controller/min_sup.dart';
import 'package:disease_analysis/controller/frequent_patterns_controller/support_count.dart';
import 'package:disease_analysis/controller/messages.dart';
import 'package:disease_analysis/view/helper/app_bar_helper.dart';
import 'package:disease_analysis/view/screens/frequent_patterns/frequent_patterns_results.dart';
import 'package:flutter/material.dart';

class FrequentPatternsSupConfScreen extends StatefulWidget {
  final int rows;
  final int columns;
  const FrequentPatternsSupConfScreen(
      {super.key, required this.columns, required this.rows});

  @override
  State<FrequentPatternsSupConfScreen> createState() =>
      FrequentPatternsSupConfScreenState();
}

class FrequentPatternsSupConfScreenState
    extends State<FrequentPatternsSupConfScreen> {
  int _minConf = 0;
  int _minSup = 0;
  int _supCount = 0;
  void setMinSupport(String val) {
    _minSup = int.parse(val);
  }

  void setSupCount(String vale) {
    _supCount = int.parse(vale);
  }

  void setMinConfidence(String vals) {
    _minConf = int.parse(vals);
  }

  var _isLoading = false;
  Future<void> _validateThis() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    await frequentPatternAlgorithm(
      columnNumber: widget.columns,
      rowNumber: widget.rows,
      minSupCount: _supCount,
      minSupportPercentage: _minSup,
      minConfidence: _minConf,
      context: context,
    ).then((result) async {
      setState(() {
        _isLoading = false;
      });
      final List t = result["final_result"];
      if (t.isEmpty) {
        return warningMessage(
            context: context, message: "No Result (High Support Count ???)");
      }
      final isConfirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'F-P Growth Implemented !',
            style: TextStyle(
              color: Colors.pink,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text(
                'See Result',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
          ],
        ),
      );

      if (isConfirmed != false) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FrequentPatternsResults(
                columns: widget.columns,
                minConfidence: _minConf,
                minSupport: _minSup,
                result: result,
                rows: widget.rows,
                supportCount: _supCount,
              ),
            ));
      }
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final double _minSupportSuggested =
    //     suggestMinSupport(widget.rows, widget.columns);
    // final double _minConfidenceSuggested =
    //     suggestMinConfidence(widget.rows, widget.columns);
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
                //getSuggestion(_minSupportSuggested, _minConfidenceSuggested),
                MinSup(minSupHandler: setMinSupport),
                MinConf(minConfHandler: setMinConfidence),
                MinSupCount(minSupCountHandler: setSupCount),
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
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Implement FP-Growth",
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
