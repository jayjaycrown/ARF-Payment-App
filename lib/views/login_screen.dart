// import 'package:arfpaymentapp/constants/routes.dart';
import 'package:arfpaymentapp/utils/form_helper.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF088E48),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: globalFormKey,
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
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Text(
                        //   'Membership ID',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 0),
                          child: FormHelper.inputFieldWidget(
                            context,
                            const Icon(Icons.person_3_rounded),
                            "username",
                            "Membership ID",
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return 'Username cannot be empty.';
                              }
                              return null;
                            },
                            (onSavedVal) {},
                          ),
                        ),
                        // const Text(
                        //   'Password ',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: FormHelper.inputFieldWidget(
                            context,
                            const Icon(Icons.lock),
                            "password",
                            "Password",
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return 'Password cannot be empty.';
                              }
                              return null;
                            },
                            (onSavedValue) {},
                          ),
                        ),
                        FormHelper.saveButton(
                          'Login',
                          () {
                            if (validateAndSave()) {}
                          },
                          context,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
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
