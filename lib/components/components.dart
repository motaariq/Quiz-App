import 'package:flutter/material.dart';

void navigateFinish(context,widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context)=>widget
    ),
        (route) => false
);