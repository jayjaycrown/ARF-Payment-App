import 'package:flutter/material.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key, required String title});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF088E48),
        title: const Text('TRANSACTION HISTORY'),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Container(),
    );
  }
}
