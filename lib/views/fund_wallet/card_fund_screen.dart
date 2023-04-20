import 'dart:developer';

import 'package:arfpaymentapp/utils/form_helper.dart';
import 'package:arfpaymentapp/views/receipt_screen.dart';
import 'package:arfpaymentapp/views/transaction_screen.dart' show TnxID;
import 'package:flutter/material.dart';

class CardFundView extends StatefulWidget {
  const CardFundView({super.key});

  @override
  State<CardFundView> createState() => _CardFundViewState();
}

// class TnxID {
//   final int id;

//   TnxID({required this.id});
// }

class _CardFundViewState extends State<CardFundView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String _cardHolderName = '';
  String _cardNumber = '';
  String _expiryDate = '';
  String _cVV = '';
  String _amount = '';
  // String _cardHolderName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF088E48),
        title: const Text('CARD'),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: globalFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Card Holder Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: FormHelper.inputFieldWidget(
                    context,
                    'cardHolderName',
                    'Holder name on card',
                    true,
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Card Holder name is required';
                      }
                      return null;
                    },
                    (onSavedValue) {
                      _cardHolderName = onSavedValue.toString().trim();
                    },
                  ),
                ),
                const Text(
                  'Card Number',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: FormHelper.inputFieldWidget(
                    context,
                    'cardNumber',
                    '1234 5678 9012 3456',
                    true,
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Card Number is required';
                      }
                      return null;
                    },
                    (onSavedValue) {
                      _cardNumber = onSavedValue.toString().trim();
                    },
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Expiry Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: FormHelper.inputFieldWidget(
                                context,
                                'expiryDate',
                                'MM/YY',
                                true,
                                (onValidateVal) {
                                  if (onValidateVal.isEmpty) {
                                    return 'Expiry date is required';
                                  }
                                  return null;
                                },
                                (onSavedValue) {
                                  _expiryDate = onSavedValue.toString().trim();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CVV',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: FormHelper.inputFieldWidget(
                                context,
                                'cvv',
                                '123',
                                true,
                                (onValidateVal) {
                                  if (onValidateVal.isEmpty) {
                                    return 'Card Security is required';
                                  }
                                  return null;
                                },
                                (onSavedValue) {
                                  _cVV = onSavedValue.toString().trim();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Text(
                  'Enter Amount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: FormHelper.inputFieldWidget(
                    context,
                    'amount',
                    '0.00',
                    true,
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Amount is required';
                      }
                      return null;
                    },
                    (onSavedValue) {
                      _amount = onSavedValue.toString().trim();
                    },
                  ),
                ),
                FormHelper.saveButton(
                  'Fund Wallet',
                  () {
                    if (validateAndSave()) {
                      log('Card holder name : $_cardHolderName');
                      log('PassCard numberword  : $_cardNumber');
                      log('Expiry date : $_expiryDate');
                      log('CVV  : $_cVV');
                      log('Amount  : $_amount');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReceiptView(
                            tnxid: TnxID(id: 1),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //   String _cardHolderName = '';
  // String _cardNumber = '';
  // String _expiryDate = '';
  // String _cVV = '';
  // String _amount = '';

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
