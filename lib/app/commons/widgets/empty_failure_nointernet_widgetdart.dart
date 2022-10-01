
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

 class EmptyFailureNoInternetWidget  {
static    Widget NoData()
      {

  // final String title, description, buttonText, image;
  // final VoidCallback onPressed;

 return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Lottie.network(
              //   image,
              //   height: 250,
              //   width: 250,
              // ),
              Icon(Icons.signal_cellular_nodata),
              SizedBox(
                height: 10,
              ),
              Text(
                "No data Found",
               style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
             
            ],
          ),
        ),
      ),
    );
      }


}
