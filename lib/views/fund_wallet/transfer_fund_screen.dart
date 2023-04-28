// ignore_for_file: unused_element, unused_local_variable

// import 'dart:async';
import 'dart:developer' show log;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:share/share.dart';

class TransferFundView extends StatefulWidget {
  const TransferFundView({super.key});

  @override
  State<TransferFundView> createState() => _TransferFundViewState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void _copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text)).then((value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Align(
          alignment: Alignment.center,
          child: Text(
            '$text copied to clipboard!',
            style: const TextStyle(
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

class _TransferFundViewState extends State<TransferFundView> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF088E48),
        title: const Text('VIRTUAL ACCOUNT'),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'You can fund your wallet by making a bank transfer or bank deposit to the account details below.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Any payment made to this account number will reflect in your wallet in a few minutes.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Screenshot(
              controller: screenshotController,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                    width: MediaQuery.of(context).size.width,
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
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, bottom: 20, right: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  'Account Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const Text(
                                'John Doe',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  String textToCopy = 'Hello, world!';
                                  _copyToClipboard(context, textToCopy);
                                },
                                color: const Color(0xFF088E48),
                                icon: const Icon(Icons.copy),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  'Account Number',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const Text(
                                '0123456789',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  String textToCopy = 'Hello, world!';
                                  _copyToClipboard(context, textToCopy);
                                },
                                color: const Color(0xFF088E48),
                                icon: const Icon(Icons.copy),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  'Bank Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const Text(
                                'Al-Hayat MFB',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  String textToCopy = 'Hello, world!';
                                  _copyToClipboard(context, textToCopy);
                                },
                                color: const Color(0xFF088E48),
                                icon: const Icon(Icons.copy),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),

            // const Spacer(),
            // // Padding()
            // ElevatedButton(
            //   onPressed: () async {
            //     // screenshotController
            //     //     .capture(delay: const Duration(milliseconds: 10))
            //     //     .then(
            //     //   (capturedImage) async {
            //     //     showCapturedWidget(context, capturedImage!);
            //     //   },
            //     // ).catchError((onError) {
            //     //   String textToCopy = onError;
            //     //   _copyToClipboard(context, textToCopy);
            //     // });
            //     // double pixelRatio = MediaQuery.of(context).devicePixelRatio;

            //     await screenshotController
            //         .capture(
            //             // pixelRatio: pixelRatio,
            //             delay: const Duration(milliseconds: 10))
            //         .then((image) async {
            //       // _saved(image as File);
            //       final result = await ImageGallerySaver.saveImage(image!);
            //       String textToCopy = "File Saved to Gallery";
            //       // _copyToClipboard(context, textToCopy);
            //       log(textToCopy);
            //       final directory = await getApplicationDocumentsDirectory();
            //       final imagePath =
            //           await File('${directory.path}/screenshot.png').create();
            //       await imagePath.writeAsBytes(image);
            //       // ignore: use_build_context_synchronously
            //       _copyToClipboard(context, textToCopy);
            //     }).catchError((onError) {
            //       String textToCopy = onError.toString();
            //       log(textToCopy);
            //       _copyToClipboard(context, textToCopy);
            //     });
            //   },
            //   style: ElevatedButton.styleFrom(
            //     // backgroundColor:
            //     shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(14),
            //       ),
            //     ),
            //     padding: const EdgeInsets.symmetric(vertical: 15),
            //     minimumSize: const Size(double.infinity, 0),
            //   ),
            //   child: const Text(
            //     'Screenshot',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18,
            //       letterSpacing: 1,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Future<dynamic> showCapturedWidget(
  //     BuildContext context, Uint8List capturedImage) {
  //   return showDialog(
  //     useSafeArea: false,
  //     context: context,
  //     builder: (context) => Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Captured widget screenshot"),
  //       ),
  //       body: Column(
  //           // ignore: unnecessary_null_comparison
  //           children: [
  //             Image.memory(capturedImage),
  //             ElevatedButton(
  //               onPressed: () => _saved,
  //               child: const Text('Save'),
  //             ),
  //           ]),
  //     ),
  //   );
  // }

  _saved(File image) async {
    final result = await ImageGallerySaver.saveImage(image.readAsBytesSync());
    String textToCopy = "File Saved to Gallery";
    // ignore: use_build_context_synchronously
    _copyToClipboard(context, textToCopy);
    log("File Saved to Gallery");
  }
}


// Any payment made to this account number will reflect in your wallet in a few minutes.