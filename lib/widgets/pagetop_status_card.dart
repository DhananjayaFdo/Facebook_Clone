// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/App_Dimentions.dart';

class CustomMiniStatusCart extends StatelessWidget {
  int index;
   CustomMiniStatusCart({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Container(
            width: 110,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: CircleAvatar(
              backgroundImage: const NetworkImage(
                  "https://www.aquaknect.com.au/wp-content/uploads/2019/11/person_outline.jpg"),
              radius: AppDimentions.height20,
            ),
          ),
          const Positioned(
            bottom: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: 100,
                child: Text(
                  "Harith Fdo",
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
