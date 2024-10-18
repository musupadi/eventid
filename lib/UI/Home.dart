import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventid/Route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Constant/Colors.dart';
import '../Constant/FontSize.dart';
import '../Constant/Testing.dart';

class Home extends StatefulWidget {
  final ScrollController controller;
  Home({required this.controller,super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool checknotif = false;
  int notifsnapshot = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: PrimaryColors(),
                border: Border(
                    bottom: BorderSide(color: Colors.black,width: 0.1)
                ),
                // image: DecorationImage(
                //     image: AssetImage("assets/img/bg_header.jpg"),fit: BoxFit.fill
                // )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    child: Image.asset(
                      "assets/img/buateventlogo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if(checknotif){
                                    checknotif = false;
                                  }else{
                                    checknotif = true;
                                  }

                                });
                              },
                              child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: const Icon(Icons.shopping_cart, size: 30)
                              ),
                            ),
                            notifsnapshot == 0 ?
                            Container()
                                :
                            checknotif ?
                            Container()
                                :
                            notifsnapshot <= 0 ?
                            Container()
                                :
                            Container(
                              width: 50,
                              height: 50,
                              child: Align(
                                alignment: FractionalOffset.topRight,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Center(
                                      child: Text(
                                        (notifsnapshot).toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: DefaultFontSize()
                                        ),
                                      )
                                  ),
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
                                  if(checknotif){
                                    checknotif = false;
                                  }else{
                                    checknotif = true;
                                  }

                                });
                              },
                              child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: const Icon(Icons.notifications, size: 30)
                              ),
                            ),
                            notifsnapshot == 0 ?
                            Container()
                                :
                            checknotif ?
                            Container()
                                :
                            notifsnapshot <= 0 ?
                            Container()
                                :
                            Container(
                              width: 50,
                              height: 50,
                              child: Align(
                                alignment: FractionalOffset.topRight,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Center(
                                      child: Text(
                                        (notifsnapshot).toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: DefaultFontSize()
                                        ),
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
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
                  controller: widget.controller,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.maxFinite,
                      height: 200,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                            height: double.maxFinite,
                            // aspectRatio: 16/9,
                            viewportFraction: 1,
                            autoPlayInterval: Duration(seconds: 10),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.5,
                            enableInfiniteScroll: false,
                            scrollDirection: Axis.horizontal,
                            scrollPhysics: BouncingScrollPhysics()
                        ),
                        itemCount: bannerList.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  bannerList[index]['img']
                                )
                              )
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    SizedBox(height: 10),
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
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: InkWell(
                                      onTap: () {
                                        toHotel(context,false);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: BackgroundGray()
                                            ),
                                            child: Icon(Icons.hotel,color: PrimaryColors()),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Hotel & Venue",
                                            style: TextStyle(
                                                fontSize: DefaultFontSize()
                                            ),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
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
                                          child: Icon(Icons.train,color: PrimaryColors()),
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
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: InkWell(
                                      onTap: () {
                                        // toTesting(context,false);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: BackgroundGray()
                                            ),
                                            child: Icon(Icons.add_location,color: PrimaryColors()),
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
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
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
                                          child: Icon(Icons.toys,color: PrimaryColors()),
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
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
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
                                          child: Icon(Icons.videocam,color: PrimaryColors()),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Production",
                                          style: TextStyle(
                                              fontSize: DefaultFontSize()
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
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
                                          child: Icon(FontAwesomeIcons.campground,color: PrimaryColors()),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Activity",
                                          style: TextStyle(
                                              fontSize: DefaultFontSize()
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
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
                                          child: Icon(FontAwesomeIcons.crown,color: PrimaryColors(),),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Tournament",
                                          style: TextStyle(
                                              fontSize: DefaultFontSize()
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
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
                                          child: Icon(FontAwesomeIcons.newspaper,color: PrimaryColors()),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("News",
                                          style: TextStyle(
                                              fontSize: DefaultFontSize()
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container()
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      width: double.maxFinite,
                      child: Text("POPULAR DESTINATION",
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
                            "Discover the finest destinations with Buatevent.id",
                            style: TextStyle(
                                fontSize: LargeFontSize(),
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "where each locations is carefully selected to offer an unforgetable experience",
                            style: TextStyle(
                                fontSize: MediumFontSize(),
                                color: Colors.black,
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 300,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: placeList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(placeList[index]['img']),fit: BoxFit.fill
                                    )
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(child: Container()),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 1
                                                  )
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    placeList[index]['name'],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: MediumFontSize(),
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              width : 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: Colors.white
                                              ),
                                              child: Icon(Icons.arrow_forward_rounded,color: Colors.black,),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      width: double.maxFinite,
                      child: Text("LATEST ACTIVITIES",
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
                            "We deliver extraordinary experiences",
                            style: TextStyle(
                                fontSize: LargeFontSize(),
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "Here's a glimpse of what we've been up to",
                            style: TextStyle(
                              fontSize: MediumFontSize(),
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: double.maxFinite,
                            height: 200,
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                  height: double.maxFinite,
                                  // aspectRatio: 16/9,
                                  viewportFraction: 1,
                                  autoPlayInterval: Duration(seconds: 10),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.5,
                                  enableInfiniteScroll: false,
                                  scrollDirection: Axis.horizontal,
                                  scrollPhysics: BouncingScrollPhysics()
                              ),
                              itemCount: activityList.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        activityList[index]['img']
                                      ),
                                        fit: BoxFit.fill
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(child: Container()),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          activityList[index]['name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediumFontSize()
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
    );
  }
}
