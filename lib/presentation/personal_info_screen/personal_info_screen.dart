import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_leading_image.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_title.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_trailing_image.dart';import 'package:sulaman_s_application007/widgets/custom_text_form_field.dart';import 'package:sulaman_s_application007/widgets/custom_elevated_button.dart';import 'package:flutter/material.dart';import 'package:sulaman_s_application007/core/app_export.dart';
// ignore_for_file: must_be_immutable
class PersonalInfoScreen extends StatelessWidget {PersonalInfoScreen({Key? key}) : super(key: key);

TextEditingController personalInfoFirstNameController = TextEditingController();

TextEditingController personalInfoLastNameController = TextEditingController();

TextEditingController personalInfoEmailController = TextEditingController();

TextEditingController personalInfoPhoneController = TextEditingController();

TextEditingController personalInfoLocationController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: Form(key: _formKey, child: SizedBox(width: double.maxFinite, child: Column(children: [SizedBox(height: 32.v), Expanded(child: SingleChildScrollView(child: Container(margin: EdgeInsets.only(bottom: 5.v), padding: EdgeInsets.symmetric(horizontal: 24.h), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("First Name", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildPersonalInfoFirstName(context), SizedBox(height: 18.v), Text("Last Name", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildPersonalInfoLastName(context), SizedBox(height: 18.v), Text("Email", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildPersonalInfoEmail(context), SizedBox(height: 18.v), Text("Phone ", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildPersonalInfoPhone(context), SizedBox(height: 18.v), Text("Location", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildPersonalInfoLocation(context)]))))]))), bottomNavigationBar: _buildSaveChanges(context))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 48.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgComponent1, margin: EdgeInsets.only(left: 24.h, top: 13.v, bottom: 13.v), onTap: () {onTapImage(context);}), centerTitle: true, title: AppbarTitle(text: "Personal Info"), actions: [AppbarTrailingImage(imagePath: ImageConstant.imgEditSquare, margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v))]); } 
/// Section Widget
Widget _buildPersonalInfoFirstName(BuildContext context) { return CustomTextFormField(controller: personalInfoFirstNameController, hintText: "Gustavo"); } 
/// Section Widget
Widget _buildPersonalInfoLastName(BuildContext context) { return CustomTextFormField(controller: personalInfoLastNameController, hintText: "Lipshutz"); } 
/// Section Widget
Widget _buildPersonalInfoEmail(BuildContext context) { return CustomTextFormField(controller: personalInfoEmailController, hintText: "xyz@gmail.com", textInputType: TextInputType.emailAddress); } 
/// Section Widget
Widget _buildPersonalInfoPhone(BuildContext context) { return CustomTextFormField(controller: personalInfoPhoneController, hintText: "+1 1234567890"); } 
/// Section Widget
Widget _buildPersonalInfoLocation(BuildContext context) { return CustomTextFormField(controller: personalInfoLocationController, hintText: "Lorem ipsun", textInputAction: TextInputAction.done, maxLines: 6, contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v)); } 
/// Section Widget
Widget _buildSaveChanges(BuildContext context) { return CustomElevatedButton(text: "Save Changes", margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 44.v), buttonStyle: CustomButtonStyles.fillGrayTL24, buttonTextStyle: CustomTextStyles.titleMediumGray50001); } 

/// Navigates back to the previous screen.
onTapImage(BuildContext context) { Navigator.pop(context); } 
 }
