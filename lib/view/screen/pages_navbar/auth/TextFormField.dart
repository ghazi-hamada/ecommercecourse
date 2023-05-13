import 'package:flutter/material.dart';

class FUNTextFormField extends StatelessWidget {
  const FUNTextFormField({
    Key? key,
    this.controller,
    required this.labeltext,
    required this.icon,
    required this.hinttext,
    required this.valid,
    this.obsText,
    this.onTapIcon,
    this.keyboard_Type,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labeltext;
  final String hinttext;
  final Widget? icon;
  final String? Function(String?) valid;
  final bool? obsText;
  final TextInputType? keyboard_Type;
  final void Function()? onTapIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextFormField(
            keyboardType: keyboard_Type,
            obscureText: obsText == null || obsText == false ? false : true,
            validator: valid,
            controller: controller,
            decoration: InputDecoration(
              hintText: hinttext,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              label: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(labeltext)),
              suffixIcon: InkWell(
                onTap: onTapIcon,
                child: icon,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(45.0),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
