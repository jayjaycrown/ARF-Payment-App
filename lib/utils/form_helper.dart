import 'package:flutter/material.dart';

class FormHelper {
  static Widget inputFieldWidget(
    BuildContext context,
    Icon icon,
    String keyName,
    String labelName,
    Function onValidate,
    Function onSaved, {
    String initialValue = "",
    obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      key: Key(keyName),
      obscureText: obscureText,
      validator: (val) {
        return onValidate(val);
      },
      onSaved: (val) {
        // ignore: void_checks
        return onSaved(val);
      },
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        // fillColor: const Color.fromARGB(1, 0, 0, 0),
        hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        hintText: labelName,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).primaryColor),
            child: icon,
          ),
        ),
      ),
    );
  }

  static Widget saveButton(
      String buttonText, Function onTap, BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            minimumSize: const Size(double.infinity, 0),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
