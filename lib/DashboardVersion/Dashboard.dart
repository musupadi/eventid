import 'package:Buatevent.id/Constant/Colors.dart';
import 'package:Buatevent.id/Constant/FontSize.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0) {
        setState(() {
          print("Zyarga Decode scrolled");
          _isScrolled = true;
        });
      } else {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            // Conditional rendering based on scroll state
            Container(
              width: double.maxFinite,
              height: 300,
              child: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/ijk_gradient.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Transforming your Events into",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: LargeFontSize(),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Memorable Journeys",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: HeaderFontSize(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: PrimaryColors(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "I'm Interested!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediumFontSize(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.maxFinite,
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                    "assets/img/ijk_gradient.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.shopping_cart),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.menu),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  "Plan your vacation, outing or outdoor activities.",
                  style: TextStyle(
                    fontSize: DefaultFontSize(),
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Join us as we continue to set the industry",
                  style: TextStyle(
                    fontSize: DefaultFontSize(),
                    color: Colors.black,
                  ),
                ),
                Text(
                  "standard, providing unparalleled event",
                  style: TextStyle(
                    fontSize: DefaultFontSize(),
                    color: Colors.black,
                  ),
                ),
                Text(
                  "management services that bring your vision to life",
                  style: TextStyle(
                    fontSize: DefaultFontSize(),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Text(
                      "500+",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: XLargeFontSize(),
                      ),
                    ),
                    Text(
                      "Client",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediumFontSize(),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Container(
                  height: 30,
                  width: 0.5,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      "360+",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: XLargeFontSize(),
                      ),
                    ),
                    Text(
                      "Tours",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediumFontSize(),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Container(
                  height: 30,
                  width: 0.5,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      "120+",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: XLargeFontSize(),
                      ),
                    ),
                    Text(
                      "Cities",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediumFontSize(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              child: Center(
                child: Text("OUR SERVICE",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: LargeFontSize()
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  "We offer comphrensive range",
                  style: TextStyle(
                      fontSize: LargeFontSize(),
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "of service designed to make",
                  style: TextStyle(
                      fontSize: LargeFontSize(),
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "your events and outing",
                  style: TextStyle(
                      fontSize: LargeFontSize(),
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "exceptional",
                  style: TextStyle(
                      fontSize: LargeFontSize(),
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: BackgroundGray()
                          ),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Hotel & Venue\nMeeting",
                          style: TextStyle(
                              fontSize: DefaultFontSize()
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: BackgroundGray()
                          ),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Transport",
                          style: TextStyle(
                              fontSize: DefaultFontSize()
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: BackgroundGray()
                          ),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Destination",
                          style: TextStyle(
                              fontSize: DefaultFontSize()
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: BackgroundGray()
                          ),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Merchandise",
                          style: TextStyle(
                              fontSize: DefaultFontSize()
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: BackgroundGray()
                          ),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Transport",
                          style: TextStyle(
                              fontSize: DefaultFontSize()
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: BackgroundGray()
                          ),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Destination",
                          style: TextStyle(
                              fontSize: DefaultFontSize()
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: BackgroundGray()
                          ),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Merchandise",
                          style: TextStyle(
                              fontSize: DefaultFontSize()
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(10),
              width: double.maxFinite,
              child: Text("POPULAR DESTINATION",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: LargeFontSize()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
