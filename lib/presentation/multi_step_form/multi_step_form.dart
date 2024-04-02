import 'package:flutter/material.dart';
import 'package:sulaman_s_application007/core/app_export.dart';

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({Key? key}) : super(key: key);

  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  int currentStep = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Step Form'),
      ),
      body: Stepper(
        currentStep: currentStep,
        onStepContinue: () {
          setState(() {
            if (currentStep < 2) {
              currentStep += 1;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (currentStep > 0) {
              currentStep -= 1;
            }
          });
        },
        steps: [
          Step(
            title: Text('Step 1'),
            content: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ],
            ),
            isActive: currentStep == 0,
          ),
          Step(
            title: Text('Step 2'),
            content: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ],
            ),
            isActive: currentStep == 1,
          ),
          Step(
            title: Text('Step 3'),
            content: Column(
              children: [
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
              ],
            ),
            isActive: currentStep == 2,
          ),
        ],
      ),
    );
  }
}
