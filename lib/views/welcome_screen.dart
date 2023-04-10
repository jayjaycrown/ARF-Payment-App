import 'package:arfpaymentapp/constants/routes.dart';
import 'package:arfpaymentapp/views/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Image.asset(
                'lib/imgs/logo.png',
                width: 140,
                height: 180,
              ),
            ),
            // const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Welcome',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Login to your account or click the Register button if this is your first time here.',
                        // textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          minimumSize: const Size(double.infinity, 0),
                        ),
                        child: const Text('Login'),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          registerRoute,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        surfaceTintColor: const Color(0xFF088E48),
                        foregroundColor: const Color(0xFF088E48),
                        // shape: const StadiumBorder(),
                        side: const BorderSide(
                            width: 1, color: Color(0xFF088E48)),

                        padding: const EdgeInsets.symmetric(vertical: 15),
                        minimumSize: const Size(double.infinity, 0),
                      ),
                      child: const Text('Register'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
