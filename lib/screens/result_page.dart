import 'package:flutter/cupertino.dart';
import '../component/bottom_button.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import '../component/reusable_code.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,@required this.interpretation,@required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Text('Your Result',style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerDeco(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                        child: Text(
                          resultText,style: kResultTextStyle,
                        ),
                    ),
                    Center(
                      child: Text(
                        bmiResult,
                        style: kBmiTextStyle,
                      ),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    )
                  ],
                ),
              ),
          ),
          BottomButton(onTap:(){
            Navigator.pop(context);
          }, buttonTitle: 'RE-CALCULATE')

        ],
      ),
    );
  }
}
