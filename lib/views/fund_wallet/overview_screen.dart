// import 'dart:developer';
import 'package:arfpaymentapp/constants/routes.dart';
import 'package:flutter/material.dart';
// import 'package:mdi/mdi.dart';

class FundWalletView extends StatefulWidget {
  const FundWalletView({super.key});

  @override
  State<FundWalletView> createState() => _FundWalletViewState();
}

class _FundWalletViewState extends State<FundWalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF088E48),
        title: const Text('FUND WALLET'),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'How do you want to fund your wallet?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(cardFundRoute);
                // log('Card');
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      color: const Color.fromRGBO(8, 142, 72, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.credit_card_outlined,
                          color: Color.fromRGBO(8, 142, 72, 1),
                          size: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Card',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // log('Transfer');
                Navigator.of(context).pushNamed(transferFundRoute);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      color: const Color.fromRGBO(8, 142, 72, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.attach_money,
                          color: Color.fromRGBO(8, 142, 72, 1),
                          size: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Transfer',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
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
}
