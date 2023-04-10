import 'dart:developer' show log;
import 'package:arfpaymentapp/constants/routes.dart';
import 'package:arfpaymentapp/utils/form_helper.dart';
import 'package:flutter/material.dart';
// import 'dart:ui';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String _branch = '';
  String _membershipId = '';
  String _password = '';
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF088E48),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFF088E48),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 40),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height - 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Form(
                  key: globalFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Branch',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: FormHelper.inputFieldWidget(
                            context,
                            'branch',
                            'Branch',
                            true,
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return 'Please select a branch';
                              }
                              return null;
                            },
                            (onSavedValue) {
                              _branch = onSavedValue.toString().trim();
                            },
                          ),
                        ),
                        const Text(
                          'Membership Number',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: FormHelper.inputFieldWidget(
                            context,
                            'membershipNumber',
                            'Membership Number',
                            true,
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return 'Please enter your Membership number';
                              }
                              return null;
                            },
                            (onSavedValue) {
                              _membershipId = onSavedValue.toString().trim();
                            },
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Name ',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              // color: Colors.black, // color for the first part
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '(Auto-generated from your branch)',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[
                                      500], // lighter color for the second part
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: FormHelper.inputFieldWidget(
                            context,
                            initialValue: 'Hello World',
                            'name',
                            'John Doe',
                            false,
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return 'Name cannot be empty';
                              }
                              return null;
                            },
                            (onSavedValue) {
                              // _password = onSavedValue.toString().trim();
                            },
                          ),
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: FormHelper.inputFieldWidget(
                            context,
                            'password',
                            'Password',
                            true,
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return 'Password is required';
                              }
                              if (onValidateVal.length < 6) {
                                return 'Password cannot be less than 6 characters';
                              }
                              return null;
                            },
                            (onSavedValue) {
                              _password = onSavedValue.toString().trim();
                            },
                            initialValue: '',
                            obscureText: hidePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Colors.black45,
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: FormHelper.saveButton(
                            'Register',
                            () {
                              if (validateAndSave()) {
                                log('Branch  : $_branch');
                                log('Membership Number : $_membershipId');
                                log('Password  : $_password');
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  successRoute,
                                  (route) => false,
                                );
                              }
                            },
                          ),
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  loginRoute,
                                );
                              },
                              child: const Text(
                                  'Already have an account?, Login here')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
