import 'package:flutter/material.dart';

class StepperForm extends StatefulWidget {
  static String tag = 'stepper-form';
  @override
  StepperFormState createState() => new StepperFormState();
}

class StepperFormState extends State<StepperForm> {
  int currentStep = 0;

  List<Step> mySteps = [
    new Step(
        title: new Text("Choose Image"),
        content:new Text("Choose Image"),
        isActive: true),
    new Step(
        title: new Text(
          "Enter Title",
          textAlign: TextAlign.center,
        ),
        content: new Text("World!"),
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Enter Description"),
        content: new Text("Hello World!"),
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: new Scaffold(
        body: Center(
          child: new Container(
              child: new Stepper(
            currentStep: this.currentStep,
            steps: mySteps,
            type: StepperType.vertical,
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
        ),
      ),
    );
  }
}
