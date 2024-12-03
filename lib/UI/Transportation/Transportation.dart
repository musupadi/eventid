import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:eventid/API/API.dart';
import 'package:eventid/Adapter/AdapterTransportation.dart';
import 'package:eventid/Constant/Colors.dart';
import 'package:eventid/Model/Ascendant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../Constant/FontSize.dart';
import '../../Constant/Testing.dart';
import '../../Model/ChatGPTService.dart';

class Transportation extends StatefulWidget {
  const Transportation({super.key});

  @override
  State<Transportation> createState() => _TransportationState();
}

class _TransportationState extends State<Transportation> {
  final ChatGPTService _chatGPTService = ChatGPTService();
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  bool checknotif = false;
  int notifsnapshot = 1;





  @override
  void initState() {
    super.initState();
    initSpeechState();
  }
  // Speech to Text
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = 'in_ID';

  bool _hasSpeech = false;
  bool _logEvents = false;
  bool _onDevice = false;
  final TextEditingController _pauseForController =
  TextEditingController(text: '3');
  final TextEditingController _listenForController =
  TextEditingController(text: '30');
  final SpeechToText speech = SpeechToText();
  List<LocaleName> _localeNames = [];
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  double level = 0.0;
  bool _isListening = false;


  Future<void> _checkPermission() async {
    var status = await Permission.microphone.status;

    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }
  void errorListener(SpeechRecognitionError error) {
    _logEvent(
        'Received error status: $error, listening: ${speech.isListening}');
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void _logEvent(String eventDescription) {
    if (_logEvents) {
      var eventTime = DateTime.now().toIso8601String();
      debugPrint('$eventTime $eventDescription');
    }
  }

  void statusListener(String status) {
    _logEvent(
        'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = status;
    });
  }

  void startListening() {
    _isListening = true;
    _logEvent('start listening');
    lastWords = '';
    lastError = '';
    final pauseFor = int.tryParse(_pauseForController.text);
    final listenFor = int.tryParse(_listenForController.text);
    final options = SpeechListenOptions(
        onDevice: _onDevice,
        listenMode: ListenMode.confirmation,
        cancelOnError: true,
        partialResults: true,
        autoPunctuation: true,
        enableHapticFeedback: true);

    speech.listen(
      onResult: resultListener,
      listenFor: Duration(seconds: listenFor ?? 30),
      pauseFor: Duration(seconds: pauseFor ?? 3),
      localeId: _currentLocaleId,
      onSoundLevelChange: soundLevelListener,
      listenOptions: options,
    );
    setState(() {});
  }

  void resultListener(SpeechRecognitionResult result) {
    _logEvent(
        'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    _isListening = false;
    lastWords = '${result.recognizedWords}';
    _controller.text = lastWords; // Masukkan teks ke dalam controller
    setState(() {
      // lastWords = '${result.recognizedWords} - ${result.finalResult}';

    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    setState(() {
      this.level = level;
    });
  }

  Future<void> initSpeechState() async {
    try {
      var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: _logEvents,
      );
      if (hasSpeech) {
        _localeNames = await speech.locales();

      }
      if (!mounted) return;

      setState(() {
        _hasSpeech = hasSpeech;
      });
    } catch (e) {
      setState(() {
        lastError = 'Speech recognition failed: ${e.toString()}';
        _hasSpeech = false;
      });
    }
  }
  // Finish Speech to Text
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BackgroundGray(),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: PrimaryColors(),
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.1)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Transportation",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: HeaderFontSize()),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              checknotif = !checknotif;
                            });
                          },
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(Icons.shopping_cart, size: 30)),
                        ),
                        notifsnapshot == 0
                            ? Container()
                            : checknotif
                            ? Container()
                            : Container(
                          width: 50,
                          height: 50,
                          child: Align(
                            alignment: FractionalOffset.topRight,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(50)),
                              child: Center(
                                  child: Text(
                                    (notifsnapshot).toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: DefaultFontSize()),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              checknotif = !checknotif;
                            });
                          },
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(Icons.notifications, size: 30)),
                        ),
                        notifsnapshot == 0
                            ? Container()
                            : checknotif
                            ? Container()
                            : Container(
                          width: 50,
                          height: 50,
                          child: Align(
                            alignment: FractionalOffset.topRight,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(50)),
                              child: Center(
                                  child: Text(
                                    (notifsnapshot).toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: DefaultFontSize()),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey,
                                  offset: Offset(0,2),
                                  spreadRadius: 2
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                            Colors.grey.withOpacity(0.3))),
                                    child: TextField(
                                      controller: _controller,
                                      decoration: InputDecoration(
                                        hintText: "Search Here",
                                        prefixIcon: Icon(Icons.search),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null, // Membuat TextField mendukung beberapa baris
                                      onChanged: (value) {
                                        setState(() {

                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    _checkPermission();
                                    startListening();
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _isListening
                                          ? Colors.red
                                          : Colors.blue,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.mic,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Delete This
                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(20),
                      //       color: Colors.white,
                      //       boxShadow: [
                      //         BoxShadow(
                      //             blurRadius: 3,
                      //             color: Colors.grey,
                      //             offset: Offset(0,2),
                      //             spreadRadius: 2
                      //         )
                      //       ],
                      //     ),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: [
                      //         SizedBox(
                      //           height: 10,
                      //         ),
                      //         Text(
                      //           "Explore Transportation & Venue",
                      //           style: TextStyle(
                      //               fontSize: HeaderFontSize(),
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Container(
                      //           margin: EdgeInsets.all(10),
                      //           width: double.maxFinite,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20),
                      //               color: Colors.white,
                      //               border: Border.all(
                      //                   color: Colors.grey.withOpacity(0.3))),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               hintText: "Search Location",
                      //               prefixIcon:
                      //               Icon(Icons.location_on_sharp),
                      //               border: InputBorder.none,
                      //             ),
                      //           ),
                      //         ),
                      //         Container(
                      //           width: double.maxFinite,
                      //           margin: EdgeInsets.all(10),
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20),
                      //               color: Colors.white,
                      //               border: Border.all(
                      //                   color: Colors.grey.withOpacity(0.3))),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               hintText: "Check In",
                      //               prefixIcon: Icon(Icons.date_range),
                      //               border: InputBorder.none,
                      //             ),
                      //           ),
                      //         ),
                      //         Container(
                      //           margin: EdgeInsets.all(10),
                      //           width: double.maxFinite,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20),
                      //               color: Colors.white,
                      //               border: Border.all(
                      //                   color: Colors.grey.withOpacity(0.3))),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               hintText: "Check Out",
                      //               prefixIcon: Icon(Icons.date_range),
                      //               border: InputBorder.none,
                      //             ),
                      //           ),
                      //         ),
                      //         Container(
                      //           margin: EdgeInsets.all(10),
                      //           width: double.maxFinite,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20),
                      //               color: Colors.white,
                      //               border: Border.all(
                      //                   color: Colors.grey.withOpacity(0.3))),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               hintText: "Guest and Room",
                      //               prefixIcon: Icon(Icons.person),
                      //               border: InputBorder.none,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Delete This
                      FutureBuilder(
                        future: TransportationNLP(context, _controller.text),
                        builder: (context, snapshot) {
                          print("Zyarga Decode "+_controller.text);
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return LoadingContainer(400, 400, "Searching Transportation");
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (snapshot.hasData && snapshot.data != null) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.requireData.length,
                              itemBuilder: (context, index) {
                                return AdapterTransportation(
                                  id: snapshot.requireData[index]['id'].toString(),
                                  name: snapshot.requireData[index]['name'].toString(),
                                  duration: snapshot.requireData[index]['duration'].toString(),
                                  price: snapshot.requireData[index]['price'].toString(),
                                  area_from: snapshot.requireData[index]['area_from'].toString(),
                                  area_to: snapshot.requireData[index]['area_to'].toString(),
                                  image: snapshot.requireData[index]['image'].toString(),
                                  type: snapshot.requireData[index]['type'].toString(),
                                );
                              },
                            );
                          } else {
                            // Jika tidak ada data yang ditemukan
                            return Center(
                              child: Text("No Transportations found"),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // THIS
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        width: double.maxFinite,
                        child: Text("WHY US",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: LargeFontSize()
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "We offers Convience, trust, and management for your outdoor events and activities",
                              style: TextStyle(
                                  fontSize: LargeFontSize(),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Why Us 1
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: BackgroundGray()
                                  ),
                                  child: Center(
                                      child: Icon(
                                          Icons.thumb_up_alt_outlined,color: PrimaryColors())
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Good Services",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: LargeFontSize(),
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        "Providing safe, comfortable, and modern transportation for land,sea,and air travel",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: LargeFontSize(),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Why Us 2
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: BackgroundGray()
                                  ),
                                  child: Center(
                                      child: Icon(
                                          Icons.bed,color: PrimaryColors())
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Comfortable Hotels",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: LargeFontSize(),
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        "We provide 24/7 room services, with comfortable hotel accommodations for all our customers",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: LargeFontSize(),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Why Us 3
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: BackgroundGray()
                                  ),
                                  child: Center(
                                      child: Icon(
                                          Icons.mobile_friendly,color: PrimaryColors())
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Booking Online",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: LargeFontSize(),
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        "Quick Booking Service to plan tourism activities and provide information about travel destination",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: LargeFontSize(),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Why Us 4
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: BackgroundGray()
                                  ),
                                  child: Center(
                                      child: Icon(
                                          Icons.thumb_up_alt_outlined,color: PrimaryColors())
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Friendly Accomodation",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: LargeFontSize(),
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        "Providing quality accomodation options tailored to the needs and budgets of our customer",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: LargeFontSize(),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        width: double.maxFinite,
                        child: Center(
                          child: Text("OUR CUSTOMER",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: LargeFontSize()
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.max,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Our Client are at the heart of everything we do,and their success is our greatest achievement",
                      //         style: TextStyle(
                      //             fontSize: LargeFontSize(),
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.bold
                      //         ),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //       SizedBox(
                      //         height: 10,
                      //       ),
                      //       Row(
                      //         children: [
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           ),
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           ),
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           )
                      //         ],
                      //       ),
                      //       Row(
                      //         children: [
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           ),
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           ),
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           )
                      //         ],
                      //       ),
                      //       Row(
                      //         children: [
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           ),
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           ),
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           )
                      //         ],
                      //       ),
                      //       Row(
                      //         children: [
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           ),
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           ),
                      //           Expanded(
                      //             flex: 1,
                      //             child: Icon(Icons.add),
                      //           )
                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Constant
                      SizedBox(
                        height: 50,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
