import 'package:arfpaymentapp/views/dashboard_screen.dart';
import 'package:arfpaymentapp/views/settings_screen.dart';
// import 'package:arfpaymentapp/views/transaction_screen.dart';
import 'package:flutter/material.dart';

class MyTabPage extends StatefulWidget {
  final int settingsTabIndex;

  const MyTabPage({super.key, this.settingsTabIndex = 0});
  // const MyTabPage({super.key});

  @override
  State<MyTabPage> createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.settingsTabIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [
          DashBoardView(title: 'Home'),
          // TransactionsView(title: 'Transactions'),
          SettingsView(title: 'Settings'),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
        ),
        child: Material(
          color: Colors.white60,
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: const Icon(Icons.home_outlined),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Home'),
                  ],
                ),
              ),
              // Tab(
              //   icon: const Icon(Icons.view_list_outlined),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: const [
              //       Text('Transactions'),
              //     ],
              //   ),
              // ),
              Tab(
                icon: const Icon(Icons.settings_outlined),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Settings'),
                  ],
                ),
              ),
            ],
            labelColor: const Color.fromRGBO(8, 142, 72, 1),
            unselectedLabelColor: Colors.black,
            labelStyle: const TextStyle(
              color: Color.fromRGBO(8, 142, 72, 1),
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
