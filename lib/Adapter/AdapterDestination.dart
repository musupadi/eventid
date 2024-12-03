import 'package:flutter/material.dart';

import '../API/Server.dart';
import '../Constant/FontSize.dart';

class AdapterDestination extends StatefulWidget {
  String id;
  String name;
  String address;
  String area;
  String price;
  String image;
  AdapterDestination({
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    required this.area,
    required this.image,

    super.key});

  @override
  State<AdapterDestination> createState() => _AdapterDestinationState();
}

class _AdapterDestinationState extends State<AdapterDestination> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(ImageBaseURL('destination')+widget.image),fit: BoxFit.fill
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
                        widget.name,
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
  }
}
