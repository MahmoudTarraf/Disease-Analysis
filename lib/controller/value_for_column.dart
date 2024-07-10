import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ValueForColumn extends StatelessWidget {
  final String name;
  final Function valueForColumnHandler;
  ValueForColumn({
    super.key,
    required this.valueForColumnHandler,
    required this.name,
  });
  String _valueForColumn = '';
  Widget _enterValueForColumn(BuildContext context) {
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
          maxLength: 1,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Value must\'nt be empty!';
            }
            if (int.parse(value) < 0 || int.parse(value) > 1) {
              return 'Value must be either 0 or 1!';
            }
            return null;
          },
          onSaved: (value) {
            _valueForColumn = value as String;
            valueForColumnHandler(_valueForColumn);
          },
          decoration: InputDecoration(
            icon: const Icon(Icons.numbers),
            hintText: "Enter Value For $name",
            hintStyle: const TextStyle(
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              '$name :',
              style: const TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          _enterValueForColumn(context),
        ],
      ),
    );
  }
}
