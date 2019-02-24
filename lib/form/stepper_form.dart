import 'package:flutter/material.dart';


class StepperForm extends StatefulWidget{
  static String tag = 'stepper-form';
  @override
  StepperFormState createState() => new StepperFormState();
}

class StepperFormState extends State<StepperForm> {
  int currentStep = 0;

  List<Step> mySteps = [
    new Step(
        title: new Text("Adım 1"),
        content: new Text("Hello!"),
        isActive: true),
    new Step(
        title: new Text("Adım 2", textAlign: TextAlign.center,),
        content: new Text("World!"),
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Adım 3"),
        content: new Text("Hello World!"),
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      
      // Body
      body: new Container(
          child: new Stepper(

            currentStep: this.currentStep,
            steps: mySteps,
            type: StepperType.horizontal,
            onStepTapped: (step) {
              setState(() {
                currentStep = step;
              });
              print("onStepTapped : " + step.toString());
            },
            onStepCancel: () {
              setState(() {
                if (currentStep > 0) {
                  currentStep = currentStep - 1;
                } else {
                  currentStep = 0;
                }
              });
              print("onStepCancel : " + currentStep.toString());
            },
            onStepContinue: () {

              setState(() {
                if (currentStep < mySteps.length - 1) {
                  currentStep = currentStep + 1;
                } else {
                  currentStep = 0;
                }
              });
              print("onStepContinue : " + currentStep.toString());
            },
          )),
    );
  }
  }