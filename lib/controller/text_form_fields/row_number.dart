import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowNumber extends StatelessWidget {
  final Function rowHandler;
  RowNumber({super.key, required this.rowHandler});
  String _rowNumber = '';
  Widget _enterRowNumber(BuildContext context) {
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
          maxLength: 4,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Rows Number must\'nt be empty!';
            }
            if (int.parse(value) > 4919) {
              return 'Max Rows Number is 4919!';
            }
            return null;
          },
          onSaved: (value) {
            _rowNumber = value as String;
            rowHandler(_rowNumber);
          },
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers),
            hintText: "Enter Number Of Rows",
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
              'Second Enter Number of Rows :',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          _enterRowNumber(context),
        ],
      ),
    );
  }
}
