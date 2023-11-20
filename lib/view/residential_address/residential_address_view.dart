import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:registered_address/view/widgets/custom_button.dart';

class ResidentialAddressView extends HookWidget {
  const ResidentialAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [CustomButton(buttonTitle: "Next", onTap: () {})],
        ),
      ),
    );
  }
}
