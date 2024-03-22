import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_leading_image.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_title.dart';import 'package:sulaman_s_application007/widgets/custom_text_form_field.dart';import 'package:sulaman_s_application007/widgets/custom_drop_down.dart';import 'package:sulaman_s_application007/widgets/custom_elevated_button.dart';import 'package:flutter/material.dart';import 'package:sulaman_s_application007/core/app_export.dart';
// ignore_for_file: must_be_immutable
class NewPositionScreen extends StatelessWidget {NewPositionScreen({Key? key}) : super(key: key);

TextEditingController frameOneEditTextController = TextEditingController();

List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

TextEditingController nameEditTextController = TextEditingController();

TextEditingController locationEditTextController = TextEditingController();

TextEditingController frameOneEditTextController1 = TextEditingController();

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: SizedBox(width: double.maxFinite, child: Column(children: [SizedBox(height: 36.v), Expanded(child: SingleChildScrollView(child: Container(margin: EdgeInsets.only(bottom: 5.v), padding: EdgeInsets.symmetric(horizontal: 24.h), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Title", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildFrameOneEditText(context), SizedBox(height: 20.v), _buildInputFieldColumn(context), SizedBox(height: 20.v), Text("Company Name", style: theme.textTheme.titleSmall), SizedBox(height: 7.v), _buildNameEditText(context), SizedBox(height: 18.v), Text("Location ", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildLocationEditText(context), SizedBox(height: 18.v), Text("Start Date", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildFrameOneRow(context, labelText: "Select Date"), SizedBox(height: 18.v), Text("End Date", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildFrameOneRow(context, labelText: "Select Date"), SizedBox(height: 20.v), Text("Job Role Description", style: theme.textTheme.titleSmall), SizedBox(height: 7.v), _buildFrameOneEditText1(context)]))))])), bottomNavigationBar: _buildSaveChangesButton(context))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 48.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgComponent1, margin: EdgeInsets.only(left: 24.h, top: 13.v, bottom: 13.v), onTap: () {onTapArrowBack(context);}), centerTitle: true, title: AppbarTitle(text: "Add New Position")); } 
/// Section Widget
Widget _buildFrameOneEditText(BuildContext context) { return CustomTextFormField(controller: frameOneEditTextController, hintText: "Ex: UI Designer"); } 
/// Section Widget
Widget _buildInputFieldColumn(BuildContext context) { return Container(decoration: BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Employment Type", style: theme.textTheme.titleSmall), SizedBox(height: 7.v), CustomDropDown(icon: Container(margin: EdgeInsets.fromLTRB(30.h, 14.v, 19.h, 13.v), child: CustomImageView(imagePath: ImageConstant.imgCheckmarkGray900, height: 24.adaptSize, width: 24.adaptSize)), hintText: "Please Select", items: dropdownItemList)])); } 
/// Section Widget
Widget _buildNameEditText(BuildContext context) { return CustomTextFormField(controller: nameEditTextController, hintText: "Ex: Shopee"); } 
/// Section Widget
Widget _buildLocationEditText(BuildContext context) { return CustomTextFormField(controller: locationEditTextController, hintText: "Ex: Singapore, Singapore"); } 
/// Section Widget
Widget _buildFrameOneEditText1(BuildContext context) { return CustomTextFormField(controller: frameOneEditTextController1, hintText: "Lorem ipsun", textInputAction: TextInputAction.done, maxLines: 6, contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v)); } 
/// Section Widget
Widget _buildSaveChangesButton(BuildContext context) { return CustomElevatedButton(text: "Save Changes", margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 37.v), onPressed: () {onTapSaveChangesButton(context);}); } 
/// Common widget
Widget _buildFrameOneRow(BuildContext context, {required String labelText, }) { return Container(padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder24), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: EdgeInsets.only(top: 2.v), child: Text(labelText, style: CustomTextStyles.titleMediumBluegray400.copyWith(color: appTheme.blueGray400))), CustomImageView(imagePath: ImageConstant.imgCalendar, height: 24.adaptSize, width: 24.adaptSize)])); } 

/// Navigates back to the previous screen.
onTapArrowBack(BuildContext context) { Navigator.pop(context); } 
/// Navigates to the experienceSettingScreen when the action is triggered.
onTapSaveChangesButton(BuildContext context) { Navigator.pushNamed(context, AppRoutes.experienceSettingScreen); } 
 }
