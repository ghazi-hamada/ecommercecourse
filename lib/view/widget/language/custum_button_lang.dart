import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustumButtonLang extends StatelessWidget {
  const CustumButtonLang({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);
  final void Function()? function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textColor: Colors.white,
        color: AppColor.primaryColor,
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
