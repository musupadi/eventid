import 'package:eventid/Constant/FontSize.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../API/Server.dart'; // Import intl package
class AdapterActivity extends StatefulWidget {
  String id;
  String name;
  String type;
  String image;
  String price;


  AdapterActivity({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.price,
    super.key
  });

  @override
  State<AdapterActivity> createState() => _AdapterActivityState();
}

class _AdapterActivityState extends State<AdapterActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Column(
        children: [
          Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.maxFinite,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                    ),
                    image: DecorationImage(image: NetworkImage(ImageBaseURL('activity')+widget.image),fit: BoxFit.fill)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(widget.type)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.type_specimen),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded( // Membuat teks dapat wrap jika kepanjangan
                        child: Text(
                          widget.type,
                          softWrap: true, // Mengizinkan teks untuk wrap ke baris berikutnya
                          overflow: TextOverflow.visible, // Mengatur overflow agar teks tidak terpotong
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text("Room Hotel & Breakfast",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SmallFontSize()
                              ),
                            ),
                            Text("Fullboard Meeting",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SmallFontSize()
                              ),
                            ),
                            Text(
                              "Halfday Meeting",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SmallFontSize()
                              ),),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text("Start From" ,textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SmallFontSize()
                              ),),
                            // Dalam widget
                            Text(
                              NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0)
                                  .format(int.parse(widget.price)), // Mengubah widget.RB menjadi format rupiah
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: LargeFontSize(),
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}