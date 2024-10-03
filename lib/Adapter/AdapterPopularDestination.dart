import 'package:flutter/material.dart';

class AdapterPopularDestination extends StatefulWidget {
  const AdapterPopularDestination({super.key});

  @override
  State<AdapterPopularDestination> createState() => _AdapterPopularDestinationState();
}

class _AdapterPopularDestinationState extends State<AdapterPopularDestination> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Row(children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1
                  )
                ),
                child: Center(
                  child: Text(
                    "Bali"
                  ),
                ),
              ),
            )
          ],
          )
        ],
      ),
    );
  }
}
