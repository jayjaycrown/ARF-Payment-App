// import 'package:arfpaymentapp/constants/routes.dart';
import 'dart:developer';
import 'package:arfpaymentapp/constants/routes.dart';
import 'package:arfpaymentapp/utils/form_helper.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
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
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 40),
                    child: Text(
                      'Login',
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
                          'Membership ID',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: FormHelper.inputFieldWidget(
                            context,
                            'membership_id',
                            'Membership ID',
                            true,
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return 'Membership ID is required';
                              }
                              return null;
                            },
                            (onSavedValue) {
                              _membershipId = onSavedValue.toString().trim();
                            },
                          ),
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14,
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
                              if (onValidateVal.length < 6) {
                                return 'Password is required';
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
                              color: Colors.black54,
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.red),
                            onPressed: () {
                              // Navigator.of(context).pushNamed(
                              //   loginRoute,
                              // );
                            },
                            child: const Text('Forgot your password?')),
                        FormHelper.saveButton(
                          'Login',
                          () {
                            if (validateAndSave()) {
                              log('Membership ID : $_membershipId');
                              log('Password  : $_password');
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                successRoute,
                                (route) => false,
                              );
                            }
                          },
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  registerRoute,
                                );
                              },
                              child: const Text(
                                  'New user?, Click here to register')),
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
