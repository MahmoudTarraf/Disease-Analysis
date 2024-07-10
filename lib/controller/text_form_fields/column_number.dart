import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColumnNumber extends StatelessWidget {
  final Function columnHandler;
  ColumnNumber({super.key, required this.columnHandler});
  String _columnNumber = '';
  Widget _enterColumnNumber(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.7),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TextFormField(
          keyboardType: TextInputType.number,
          maxLength: 3,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Columns Number must\'nt be empty!';
            }
            if (int.parse(value) > 132) {
              return 'Max Columns Number is 132!';
            }
            return null;
          },
          onSaved: (value) {
            _columnNumber = value as String;
            columnHandler(_columnNumber);
          },
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers),
            hintText: "Enter Number Of Columns",
            hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'First Enter Number of Columns :',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          _enterColumnNumber(context),
        ],
      ),
    );
  }
}
