import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sulaman_s_application007/core/app_export.dart';

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({Key? key}) : super(key: key);

  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  int currentStep = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Define controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController projectIdController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController codeController = TextEditingController();


  // Validation functions
  String? validateSupervisorName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your supervisor\'s name';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Name should not contain numbers';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Name should not contain numbers';
    }
    return null;
  }

  String? validateFatherName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your father\'s name';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Name should not contain numbers';
    }
    return null;
  }

  String? validateStateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your state';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'State Name should not contain numbers';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateDepartment(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid Department Name';
    }
    if (value.length < 8) {
      return 'Department Name should not contain numbers';
    }
    return null;
  }

  String? validateProjectId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid Project ID';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Project ID should not contain letters';
    }
    return null;
  }
  String? validateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid Postal Code';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Postal Code should not contain letters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Funding Form',
          style: CustomTextStyles.titleMedium18,
        ),
      ),
      body: SingleChildScrollView( // Wrap Scaffold with SingleChildScrollView
        child: Theme(
          data: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Change text color to white
              ),
            ),
          ),
          // Inside the build method of _MultiStepFormState
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction, // Change autovalidateMode to onUserInteraction
            child: Column(
              children: [
                // Stepper for navigating between sections
                Stepper(
                  currentStep: currentStep,
                  onStepContinue: () {
                    setState(() {
                      if (currentStep < 2) {
                        currentStep += 1;
                      }
                    });
                  },
                  steps: [
                    Step(
                      title: Text('Supervisor Details'),
                      content: buildSupervisorDetailsSection(),
                      isActive: currentStep == 0,
                      state: StepState.editing,
                    ),
                    Step(
                      title: Text('Address'),
                      content: buildAddressSection(),
                      isActive: currentStep == 1,
                      state: StepState.editing,
                    ),
                    Step(
                      title: Text('Project Team Lead'),
                      content: buildProjectTeamLeadSection(),
                      isActive: currentStep == 2,
                      state: StepState.editing,
                    ),
                    Step(
                      title: Text('Postal Address'),
                      content: buildPostalAddressSection(),
                      isActive: currentStep == 3,
                      state: StepState.editing,
                    ),
                    Step(
                      title: Text('University Details'),
                      content: buildPostalAddressSection(),
                      isActive: currentStep == 4,
                      state: StepState.editing,
                    ),
                  ],

                ),

                // Button to submit the form
                ElevatedButton(
                  onPressed: () {
                    // Manually trigger validation when the user tries to submit
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission if all fields are valid
                      }
                    });
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build Supervisor Details section
  Widget buildSupervisorDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Email Address'),
          validator: validateEmail,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Name'),
          validator: validateSupervisorName,
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Personal Email Address'),
          validator: validateEmail,
        ),
        TextFormField(
          controller: departmentController,
          decoration: InputDecoration(labelText: 'Department'),
          validator: validateDepartment,
        ),
      ],
    );
  }

  // Build Address section
  Widget buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: addressController,
          decoration: InputDecoration(labelText: 'Address'),
        ),
        TextFormField(
          controller: cityController,
          decoration: InputDecoration(labelText: 'City'),
        ),
        TextFormField(
          controller: stateController,
          decoration: InputDecoration(labelText: 'State'),
          validator: validateStateName,
        ),
        TextFormField(
          controller: countryController,
          decoration: InputDecoration(labelText: 'Country'),
        ),
      ],
    );
  }

  // Build Project Team Lead section
  Widget buildProjectTeamLeadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Email'),
          validator: validateEmail,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'First Name'),
          validator: validateName,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Last Name'),
          validator: validateName,
        ),
        TextFormField(
          controller: fatherNameController,
          decoration: InputDecoration(labelText: 'Father Name'),
          validator: validateName,
        ),
        TextFormField(
          controller: projectIdController,
          decoration: InputDecoration(labelText: 'Project ID'),
          validator: validateProjectId,
        ),
        TextFormField(
          controller: rollNumberController,
          decoration: InputDecoration(labelText:'Roll Number'),
        ),
      ],
    );
  }
  Widget buildPostalAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: addressController,
          decoration: InputDecoration(labelText: 'Address'),
          validator: validateEmail,
        ),
        TextFormField(
          controller: stateController,
          decoration: InputDecoration(labelText: 'State'),
          validator: validateStateName,
        ),
        TextFormField(
          controller: cityController,
          decoration: InputDecoration(labelText: 'City'),
        ),
        TextFormField(
          controller: fatherNameController,
          decoration: InputDecoration(labelText: 'Country'),
        ),
        TextFormField(
          controller: codeController,
          decoration: InputDecoration(labelText: 'Postal Code'),
          validator: validateCode,
        ),
        TextFormField(
          controller: rollNumberController,
          decoration: InputDecoration(labelText: 'Roll Number'),
        ),
      ],
    );
  }
  Widget buildUniversityDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Email'),
          validator: validateEmail,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'First Name'),
          validator: validateName,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Last Name'),
          validator: validateName,
        ),
        TextFormField(
          controller: fatherNameController,
          decoration: InputDecoration(labelText: 'Father Name'),
          validator: validateFatherName,
        ),
        TextFormField(
          controller: projectIdController,
          decoration: InputDecoration(labelText: 'Project ID'),
          validator: validateProjectId,
        ),
        TextFormField(
          controller: rollNumberController,
          decoration: InputDecoration(labelText: 'Roll Number'),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MultiStepForm(),
  ));
}
