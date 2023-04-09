import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'An email has been sent to you, Please click the link to verify your email address.'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'If you didn\'t receive an email, press the button below to try again.'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextButton(
                    onPressed: () async {
                      // await AuthService.firebase().sendEmailVerification();
                    },
                    child: const Text('Re-send verification email')),
              ),
              TextButton(
                onPressed: () async {
                  // await AuthService.firebase().logOut();
                },
                child: const Text('Restart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
