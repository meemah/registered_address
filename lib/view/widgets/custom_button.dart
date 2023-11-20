import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Function() onTap;
  final bool isButtonEnabled;
  const CustomButton(
      {super.key,
      required this.buttonTitle,
      required this.onTap,
      this.isButtonEnabled = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      elevation: 0,
      color:
          Theme.of(context).primaryColor.withOpacity(isButtonEnabled ? 1 : 0.3),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      height: 50.h,
      onPressed: () {
        if (isButtonEnabled) {
          onTap();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
