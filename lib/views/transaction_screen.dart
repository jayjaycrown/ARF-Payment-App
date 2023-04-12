// import 'package:arfpaymentapp/constants/routes.dart';
import 'package:arfpaymentapp/views/receipt_screen.dart';
import 'package:flutter/material.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:intl/intl.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key, required String title});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

// class Tnx {
//   final int id;

//   Tnx({required this.id});
// }
class TnxID {
  final int id;

  TnxID({required this.id});
}

class _TransactionsViewState extends State<TransactionsView> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF088E48),
        title: const Text('TRANSACTION HISTORY'),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "SORT BY",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        showCustomDateRangePicker(
                          context,
                          dismissible: true,
                          minimumDate: DateTime.now()
                              .subtract(const Duration(days: 120)),
                          maximumDate:
                              DateTime.now().add(const Duration(days: 120)),
                          endDate: endDate,
                          startDate: startDate,
                          backgroundColor: Colors.white,
                          primaryColor: const Color.fromRGBO(8, 142, 72, 1),
                          onApplyClick: (start, end) {
                            setState(() {
                              endDate = end;
                              startDate = start;
                            });
                          },
                          onCancelClick: () {
                            setState(() {
                              endDate = null;
                              startDate = null;
                            });
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.date_range_outlined),
                          SizedBox(width: 2),
                          Text('Select Date'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: const Color.fromRGBO(8, 142, 72, 1),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'From: ${startDate != null ? DateFormat("dd/MM").format(startDate!) : '-'}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        color: const Color.fromRGBO(8, 142, 72, 1),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ' To: ${endDate != null ? DateFormat("dd/MM").format(endDate!) : '-'}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     padding: const EdgeInsets.symmetric(horizontal: 30),
                  //     shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(10),
                  //       ),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: const Text('Filter'),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiptView(
                          tnxid: TnxID(id: 1),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit money',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 0, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiptView(
                          tnxid: TnxID(id: 2),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Fund Wallet',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(8, 142, 72, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiptView(
                          tnxid: TnxID(id: 3),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit money',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 0, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Fund Wallet',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(8, 142, 72, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit money',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 0, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Fund Wallet',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(8, 142, 72, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit money',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 0, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Fund Wallet',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(8, 142, 72, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit money',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 0, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    // height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(45, 106, 79, .1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Fund Wallet',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      // balanceAmount,
                                      '24 December, 2022 12:03 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        // color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(8, 142, 72, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
