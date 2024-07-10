import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MinSup extends StatelessWidget {
  final Function minSupHandler;
  MinSup({super.key, required this.minSupHandler});
  String _minSup = '';
  Widget _enterMinSup(BuildContext context) {
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
              return 'Minimum Support Percentage must\'nt be empty!';
            }
            if (int.parse(value) > 100 || int.parse(value) < 1) {
              return 'Minimum Support Percentage can\'t exceed 100!';
            }
            return null;
          },
          onSaved: (value) {
            _minSup = value as String;
            minSupHandler(_minSup);
          },
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers),
            hintText: "Enter Min-Sup Percentage",
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
              'Minimum Support Percentage :',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          _enterMinSup(context),
        ],
      ),
    );
  }
}
