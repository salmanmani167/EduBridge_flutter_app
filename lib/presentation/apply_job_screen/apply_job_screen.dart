import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_leading_image.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_title.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_trailing_image.dart';import 'package:sulaman_s_application007/widgets/custom_text_form_field.dart';import 'package:dotted_border/dotted_border.dart';import 'package:sulaman_s_application007/widgets/custom_elevated_button.dart';import 'package:flutter/material.dart';import 'package:sulaman_s_application007/core/app_export.dart';import 'package:sulaman_s_application007/presentation/apply_job_popup_dialog/apply_job_popup_dialog.dart';
// ignore_for_file: must_be_immutable
class ApplyJobScreen extends StatelessWidget {ApplyJobScreen({Key? key}) : super(key: key);

TextEditingController fullNameController = TextEditingController();

TextEditingController emailController = TextEditingController();

TextEditingController frameOneController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: SizedBox(width: SizeUtils.width, child: SingleChildScrollView(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), child: Form(key: _formKey, child: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 31.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildInputField1(context), SizedBox(height: 26.v), _buildInputField2(context), SizedBox(height: 28.v), Text("Upload CV", style: theme.textTheme.titleSmall), SizedBox(height: 7.v), _buildUploadSection(context), SizedBox(height: 28.v), _buildInputField3(context), SizedBox(height: 5.v)]))))), bottomNavigationBar: _buildContinueButton(context))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 51.v, leadingWidth: 48.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgComponent1, margin: EdgeInsets.only(left: 24.h, top: 13.v, bottom: 14.v), onTap: () {onTapImage(context);}), centerTitle: true, title: AppbarTitle(text: "Apply Job"), actions: [AppbarTrailingImage(imagePath: ImageConstant.imgComponent3, margin: EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 14.v))]); } 
/// Section Widget
Widget _buildInputField1(BuildContext context) { return Container(decoration: BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Full Name", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), CustomTextFormField(controller: fullNameController, hintText: "Brooklyn Simmons")])); } 
/// Section Widget
Widget _buildInputField2(BuildContext context) { return Container(decoration: BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Email Address", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), CustomTextFormField(controller: emailController, hintText: "xyz@gmail.com", textInputType: TextInputType.emailAddress)])); } 
/// Section Widget
Widget _buildUploadSection(BuildContext context) { return DottedBorder(color: appTheme.gray300, padding: EdgeInsets.only(left: 1.h, top: 1.v, right: 1.h, bottom: 1.v), strokeWidth: 1.h, radius: Radius.circular(24), borderType: BorderType.RRect, dashPattern: [6, 6], child: Container(padding: EdgeInsets.symmetric(horizontal: 124.h, vertical: 39.v), decoration: AppDecoration.outlineGray300.copyWith(borderRadius: BorderRadiusStyle.roundedBorder24), child: Column(mainAxisSize: MainAxisSize.min, children: [CustomImageView(imagePath: ImageConstant.imgCloudUpload1, height: 40.adaptSize, width: 40.adaptSize), SizedBox(height: 8.v), Text("Upload File", style: CustomTextStyles.titleSmallSemiBold)]))); } 
/// Section Widget
Widget _buildInputField3(BuildContext context) { return Container(decoration: BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Website, Blog, or Portfolio", style: theme.textTheme.titleSmall), SizedBox(height: 7.v), CustomTextFormField(controller: frameOneController, hintText: "http://...", textInputAction: TextInputAction.done)])); } 
/// Section Widget
Widget _buildContinueButton(BuildContext context) { return CustomElevatedButton(text: "Continue", margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 40.v), onPressed: () {onTapContinueButton(context);}); } 

/// Navigates back to the previous screen.
onTapImage(BuildContext context) { Navigator.pop(context); } 

/// Displays a dialog with the [ApplyJobPopupDialog] content.
onTapContinueButton(BuildContext context) { showDialog(context: context, builder: (_) => AlertDialog(content: ApplyJobPopupDialog(),backgroundColor: Colors.transparent, contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0),)); } 
 }
