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
  // String branch = '';
  // String _membership_no = '';
  // String _password = '';
  late final TextEditingController _branch;
  late final TextEditingController _membershipNo;
  late final TextEditingController _password;

  @override
  void initState() {
    _branch = TextEditingController();
    _membershipNo = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _branch.dispose();
    _membershipNo.dispose();
    _password.dispose();
    super.dispose();
  }

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
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Branch',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.grey[200], // set the background color
                              borderRadius: BorderRadius.circular(
                                  10.0), // set the border radius
                            ),
                            child: FormHelper.inputFieldWidget(
                              context,
                              'branch',
                              'Branch',
                              () {},
                              () {},
                            ),
                          ),
                        ),
                        const Text(
                          'Membership Number',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.grey[200], // set the background color
                              borderRadius: BorderRadius.circular(
                                  10.0), // set the border radius
                            ),
                            child: FormHelper.inputFieldWidget(
                              context,
                              'membershipNumber',
                              'Membership Number',
                              () {},
                              () {},
                            ),
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
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.grey[200], // set the background color
                              borderRadius: BorderRadius.circular(
                                  10.0), // set the border radius
                            ),
                            child: FormHelper.inputFieldWidget(
                              context,
                              'name',
                              'John Doe',
                              () {},
                              () {},
                            ),
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
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.grey[200], // set the background color
                              borderRadius: BorderRadius.circular(
                                  10.0), // set the border radius
                            ),
                            child: FormHelper.inputFieldWidget(
                              context,
                              'password',
                              'Password',
                              () {},
                              () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: FormHelper.saveButton(
                            'Register',
                            () {
                              if (validateAndSave()) {}
                            },
                          ),
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
