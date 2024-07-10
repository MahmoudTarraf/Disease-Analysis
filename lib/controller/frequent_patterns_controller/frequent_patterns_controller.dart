// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:disease_analysis/router/config.dart';
import 'package:disease_analysis/controller/messages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

double suggestMinSupport(int row_number, int column_number) {
  double average_items_per_transaction = column_number / row_number;
  double default_support_percentage = 5.0;
  double suggested_min_support =
      average_items_per_transaction * default_support_percentage * 100;
  if (suggested_min_support <= 5) {
    suggested_min_support *= 10;
  }
  if (suggested_min_support > 100) {
    suggested_min_support /= 10;
  }
  return suggested_min_support;
}

double suggestMinConfidence(int row_number, int column_number) {
  double average_items_per_transaction = column_number / row_number;
  double default_confidence_percentage = 7.0;
  double suggested_min_confidence =
      average_items_per_transaction * default_confidence_percentage * 100;
  if (suggested_min_confidence <= 5) {
    suggested_min_confidence *= 10;
  }
  if (suggested_min_confidence > 100) {
    suggested_min_confidence /= 10;
  }
  return suggested_min_confidence;
}

// {"min_support":10, "min_confidence":10, "rows":200, "columns":20}
Future<Map> frequentPatternAlgorithm({
  required int columnNumber,
  required int rowNumber,
  required int minSupportPercentage,
  required int minSupCount,
  required int minConfidence,
  required BuildContext context,
}) async {
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    "rows": rowNumber,
    "columns": columnNumber,
    "min_support_percentage": minSupportPercentage,
    "min_support_count": minSupCount,
    "min_confidence": minConfidence
  });
  final response = await http.post(
    Uri.parse('${Config.url}calculate_apriori'),
    headers: headers,
    body: body,
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data;
  } else {
    warningMessage(
        context: context, message: 'error: ${response.reasonPhrase}');
    return {};
  }
}
