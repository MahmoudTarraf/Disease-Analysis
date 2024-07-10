// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:disease_analysis/router/config.dart';
import 'package:disease_analysis/controller/messages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> knnResult = {};
Map<String, dynamic> get getknnResultMap => knnResult;
void setknnResultMap(Map a) {
  knnResult = a as Map<String, dynamic>;
}

Future<List<String>> getColumnsNames({
  required int colNumber,
  required BuildContext context,
}) async {
  List<String> columnsList = [];
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({"num_columns": colNumber});
  final response = await http.post(
    Uri.parse('${Config.url}getcolumnnames'),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    columnsList = data['column_names']?.cast<String>() ??
        []; // Handle potential null value
  } else {
    warningMessage(
        context: context, message: 'error: ${response.reasonPhrase}');
  }
  return columnsList;
}

Future<void> knnAlgorithm({
  required int columnNumber,
  required int rowNumber,
  required int kNumber,
  required Map newData,
  required BuildContext context,
}) async {
  final headers = {'Content-Type': 'application/json'};

  final body = jsonEncode({
    "num_rows": rowNumber,
    "num_columns": columnNumber,
    "k": kNumber,
    "new_data": newData
  });
  final response = await http.post(
    Uri.parse('${Config.url}calculateknn'),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    setknnResultMap(data);
  } else {
    warningMessage(
        context: context, message: 'error: ${response.reasonPhrase}');
  }
}

Future<List<dynamic>> getTargetClass({
  required BuildContext context,
}) async {
  var targetList = [];
  final headers = {'Content-Type': 'application/json'};
  final response = await http.get(
    Uri.parse('${Config.url}gettargetclass'),
    headers: headers,
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    targetList = data['expected_disease'];
  } else {
    warningMessage(
        context: context, message: 'error: ${response.reasonPhrase}');
  }
  return targetList;
}

Future<void> addRow({
  required List<String> newData,
  required BuildContext context,
}) async {
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({"new_data": newData});
  final response = await http.post(
    Uri.parse('${Config.url}addrow'),
    headers: headers,
    body: body,
  );
  if (response.statusCode == 200) {
    successMessage(context: context, message: "Added Row Successfully!");
  } else {
    warningMessage(
        context: context, message: 'error: ${response.reasonPhrase}');
  }
}

Future<void> removeRow({
  required int index,
  required BuildContext context,
}) async {
  final headers = {'Content-Type': 'application/json'};

  final body = jsonEncode({"index": index});
  final response = await http.post(
    Uri.parse('${Config.url}removerow'),
    headers: headers,
    body: body,
  );
  if (response.statusCode == 200) {
    successMessage(context: context, message: "Removed Row Successfully!");
  } else {
    warningMessage(
        context: context, message: 'error: ${response.reasonPhrase}');
  }
}
