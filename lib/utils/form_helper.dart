import 'package:flutter/material.dart';

class FormHelper {
  static Widget inputFieldWidget(
    BuildContext context,
    String keyName,
    String labelName,
    Function onValidate,
    Function onSaved, {
    String initialValue = "",
    obscureText = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
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
      // decoration: const InputDecoration(
      //   contentPadding:
      //       EdgeInsets.only(left: 16.0, right: 16.0, top: 0, bottom: 0),
      //   border: InputBorder.none,
      //   hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      //   hintText: 'John Doe ',
      // ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Color.fromRGBO(231, 233, 232, 1), width: 0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color.fromRGBO(231, 233, 232, 1),
            width: 1,
          ),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(231, 233, 232, 1),
        contentPadding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: 0, bottom: 0),
        // border: InputBorder.none,
        hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        prefixIcon: prefixIcon,
        hintText: labelName,
        suffixIcon: suffixIcon,
      ),
    );
  }

  static Widget saveButton(String buttonText, Function onClick) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            onClick();
          },
          style: ElevatedButton.styleFrom(
            // backgroundColor:
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
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

  static Widget submitButton(
    String buttonText,
    Function onTap,
    // BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 1,
          ),
          color: const Color.fromRGBO(8, 142, 72, 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
