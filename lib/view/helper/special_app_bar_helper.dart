// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SpecialAppBarHelper extends StatelessWidget {
  SpecialAppBarHelper({
    super.key,
    required this.name,
    required this.val,
  });
  double? val;
  String name;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    textDirection: TextDirection.ltr,
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: val,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
