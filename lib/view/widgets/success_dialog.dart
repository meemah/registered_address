import 'package:flutter/material.dart';

import '../../model/address.dart';

class SuccessDialog extends StatelessWidget {
  final Address address;
  const SuccessDialog({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Added Successfully',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: Text('Your residential address in ${address.country}'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
