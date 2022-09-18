import 'dart:math';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/components/components.dart';
import 'package:quiz_app/result/loser_screen.dart';
import 'package:quiz_app/result/result_screen.dart';
class QuizModel {
  late String question;
  late bool? answer;
  QuizModel({
    this.answer,
    required this.question
});
}
class HomeLayout extends StatefulWidget {
  static List <QuizModel> list = [
    QuizModel(
      question: 'Have you ever wrote a letter?'
    ),
    QuizModel(
        question: 'Have you ever smoked a cigarette?'
    ),
    QuizModel(
        question: 'Have you ever had a fight with someone who was too old?'
    ),
    QuizModel(
        question: 'Have you ever been on the radio or on television?'
    ),
    QuizModel(
        question: 'Have you ever stayed awake for an entire night?'
    ),
    QuizModel(
        question: 'Have you ever broken something, like a window, and ran away?'
    ),
    QuizModel(
        question: 'Have you ever won a contest and received a prize?'
    ),
    QuizModel(
        question: 'Have you ever met a famous person or a celebrity?'
    )
  ];

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var el = randomChoice(HomeLayout.list);

  var quizController = PageController();

  bool ?answer;

  int truePoints=0;

  int falsePoints=0;

  bool isLast= false;

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
      body: PageView.builder(
        itemBuilder: (context,index)=>questionBuilder(HomeLayout.list[index]),
        itemCount: 5,
        controller: quizController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int index){
          if(index==4){
            setState(() {

              isLast=true;
            });
            print('last');
          }else{
            print('not last');
            setState(() {
              isLast=false;
            });
          }
        },
      ),
    );
  }

  Widget questionBuilder(QuizModel model)=>Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(model.question,
            maxLines: 2,
            style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        MaterialButton(
          color: Colors.green,
          onPressed: (){
            if(isLast==true){
              if(truePoints==4){
                navigateFinish(context, ResultScreen());
              }else{
                navigateFinish(context, LoserScreen());
              }
            }
            truePoints++;
            quizController.nextPage(duration: const Duration(milliseconds: 750), curve: Curves.fastOutSlowIn);
            print(truePoints);
          },
          child:const Text('Yes',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        MaterialButton(
          color: Colors.red,
          onPressed: (){
            if(isLast==true){
              navigateFinish(context, LoserScreen());
            }
            falsePoints++;
            quizController.nextPage(duration: const Duration(milliseconds: 750), curve: Curves.fastOutSlowIn);
            print(falsePoints);
          },
          child:const Text('No',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        )
      ],
    ),
  );
}
