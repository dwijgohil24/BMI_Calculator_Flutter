import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/icon_content.dart';
import '../component/reusable_code.dart';
import '../constants.dart';
import 'result_page.dart';
import '../component/round_icon_button.dart';
import '../component/bottom_button.dart';
import 'bmi_calculator_brain.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  child: ContainerDeco(
                    colour: selectedGender==Gender.male?kActiveCardColor: kInactiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,label:'MALE',
                    ),
                  ),
                ),//here ContainerDeco is the extracted widget for decoration of containers,made to shorten the code by eliminating repetitive use of same widget and code.
              ),
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    child: ContainerDeco(
                        colour: selectedGender==Gender.female?kActiveCardColor: kInactiveCardColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,label:'FEMALE',
                      ),
                    ),
                  ),
              ),
            ],
          ),
          ),
          // YE SECOND BICH WALA BOX HE.
          Expanded(
              child: ContainerDeco(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                    style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString( ),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                      },
                    )
                  ],
              ),
          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(
                  child: ContainerDeco(
                      colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                }
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                }
                                );
                              },
                            ),
                          ],

                        ),

                      ],
                    ),
                  ),
              ),
              Expanded(
                  child: ContainerDeco(
                      colour:
                      Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                }
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                }
                                );
                              },
                            ),
                          ],

                        ),
                      ],
                    ),
                  ),
              ),
            ],
          ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBmi(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),
              ),
              );
            },
          ),
        ],
      )
    );
  }
}






