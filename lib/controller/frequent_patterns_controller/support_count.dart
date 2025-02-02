import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MinSupCount extends StatelessWidget {
  final Function minSupCountHandler;
  MinSupCount({super.key, required this.minSupCountHandler});
  String _minSupCount = '';
  Widget _enterMinSupCount(BuildContext context) {
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
              return 'Support Count must\'nt be empty!';
            }
            if (int.parse(value) < 1) {
              return 'Support Count can\'t be zero!';
            }
            return null;
          },
          onSaved: (value) {
            _minSupCount = value as String;
            minSupCountHandler(_minSupCount);
          },
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers),
            hintText: "Enter Min-Sup Count",
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
              'Minimum Support Count :',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          _enterMinSupCount(context),
        ],
      ),
    );
  }
}
