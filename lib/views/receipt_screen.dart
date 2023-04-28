import 'dart:developer';
// import 'dart:io';
import 'dart:ui' as ui;
// import 'dart:async';
import 'dart:typed_data';
// import 'package:arfpaymentapp/views/transaction_screen.dart';
import 'package:arfpaymentapp/views/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ReceiptView extends StatefulWidget {
  final TnxID tnxid;
  const ReceiptView({super.key, required this.tnxid});

  @override
  State<ReceiptView> createState() => _ReceiptViewState();
}

class _ReceiptViewState extends State<ReceiptView> {
  final GlobalKey _globalKey = GlobalKey();

  // late final int tid = this.tnx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        foregroundColor: const Color(0xFF088E48),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              child: RepaintBoundary(
                key: _globalKey,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(8, 142, 72, 1),
                          width: 1,
                        ),
                        color: const Color.fromRGBO(234, 240, 237, 1),
                        image: const DecorationImage(
                          image: AssetImage('lib/imgs/logo_trans.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Transaction Receipt',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 20),
                              child: Center(
                                child: Text(
                                  '\u{20A6} 90,000.00',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    // color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: const [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Name',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: const [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Membership ID',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '006/001',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: const [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Payment Option',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Card Payment',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Payment Type',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 8),
                              child: Row(
                                children: const [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Development',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '\u{20A6} 10,000.00',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 8),
                              child: Row(
                                children: const [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Shares',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '\u{20A6} 10,000.00',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 8),
                              child: Row(
                                children: const [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Savings',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '\u{20A6} 10,000.00',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 8),
                              child: Row(
                                children: const [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Ileya',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '\u{20A6} 10,000.00',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Transaction Ref',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${widget.tnxid.id}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: _saveScreen,
                  child: const Text(
                    'Download',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _saveScreen,
      //   tooltip: 'Take a screenshot',
      //   child: const Icon(Icons.download),
      // ),
    );
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(const ClipboardData()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Align(
            alignment: Alignment.center,
            child: Text(
              'Saved to gallery!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      );
    });
  }

  _saveScreen() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      log(result.toString());
      // ignore: use_build_context_synchronously
      _copyToClipboard(context);
    }
  }
}
