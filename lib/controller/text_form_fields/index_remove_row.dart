import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IndexRemoveRow extends StatelessWidget {
  final Function indexRemoveHandler;
  IndexRemoveRow({super.key, required this.indexRemoveHandler});
  String _indexRemoveRow = '';
  Widget _enterIndexRemoveRow(BuildContext context) {
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
              return 'Index must\'nt be empty!';
            }
            if (int.parse(value) > 4920) {
              return 'Max Rows Number is 4920!';
            }
            if (int.parse(value) < 2) {
              return 'Index must\'nt be less than 2!';
            }
            return null;
          },
          onSaved: (value) {
            _indexRemoveRow = value as String;
            indexRemoveHandler(_indexRemoveRow);
          },
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers),
            hintText: "Enter Index to remove Row",
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
              'Please Enter Index:',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          _enterIndexRemoveRow(context),
        ],
      ),
    );
  }
}
