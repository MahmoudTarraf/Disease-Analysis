import 'package:flutter/material.dart';

// ignore: must_be_immutable
class KNumber extends StatelessWidget {
  final Function kHandler;
  KNumber({super.key, required this.kHandler});
  String _kNumber = '';
  Widget _enterKNumber(BuildContext context) {
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
              return 'K must\'nt be empty!';
            }
            if (int.parse(value) > 4920) {
              return 'Max Rows Number is 4920!';
            }
            return null;
          },
          onSaved: (value) {
            _kNumber = value as String;
            kHandler(_kNumber);
          },
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers),
            hintText: "Default K = 70 !",
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
              'Please Enter K :',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          _enterKNumber(context),
        ],
      ),
    );
  }
}
