import 'package:flutter/material.dart';
import 'package:quiz_app/components/components.dart';
import 'package:quiz_app/home_layout/home_layout.dart';

class LoserScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Have You Ever',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:  [
            const Image(image:AssetImage('images/loser.png'),
            ),
            MaterialButton(
              color: Colors.red,
              child: const Text('Play again',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              ),
              onPressed: (){
                navigateFinish(context, HomeLayout());
              }
            )
          ],
        ),
      ),
    );
  }
}
