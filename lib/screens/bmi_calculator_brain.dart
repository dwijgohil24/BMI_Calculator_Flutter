import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final height;
  final weight;
  double _bmi;

  String calculateBmi(){
    _bmi=weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'OverWeight';
    }
    else if(_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'Your have higher than normal body weight.Try to exercise more!!';
    }
    else if(_bmi >= 18.5){
      return 'You have a normal body weight. Good job!';
    }
    else{
      return 'Your have lower than normal body weight.Try to eat more!!';
    }
  }

}