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
  TextEditingController confirmPasswordController = TextEditingController();

  // GlobalKey for accessing the FormState
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Validation function for the name field
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Name should not contain numbers';
    }
    return null;
  }

  // Validation function for the email field
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validation function for the password field
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Step Form'),
      ),
      body: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Change text color to white
            ),
          ),
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always, // Enable auto-validation
          child: Stepper(
            currentStep: currentStep,
            onStepContinue: () {
              setState(() {
                if (currentStep < 3) {
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
                      validator: validateName,
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
                      validator: validateEmail,
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
                      validator: validatePassword,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration:
                          InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                isActive: currentStep == 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MultiStepForm(),
  ));
}
