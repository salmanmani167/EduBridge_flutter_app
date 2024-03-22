import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_leading_image.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_title.dart';import 'package:sulaman_s_application007/widgets/custom_text_form_field.dart';import 'package:sulaman_s_application007/widgets/custom_drop_down.dart';import 'package:sulaman_s_application007/widgets/custom_elevated_button.dart';import 'package:flutter/material.dart';import 'package:sulaman_s_application007/core/app_export.dart';
// ignore_for_file: must_be_immutable
class AddNewEducationScreen extends StatelessWidget {AddNewEducationScreen({Key? key}) : super(key: key);

TextEditingController schoolEditTextController = TextEditingController();

List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

TextEditingController fieldOfStudyEditTextController = TextEditingController();

TextEditingController gradeEditTextController = TextEditingController();

TextEditingController descriptionEditTextController = TextEditingController();

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: SizedBox(width: double.maxFinite, child: Column(children: [SizedBox(height: 32.v), Expanded(child: SingleChildScrollView(child: Container(margin: EdgeInsets.only(bottom: 5.v), padding: EdgeInsets.symmetric(horizontal: 24.h), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("School", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildSchoolEditText(context), SizedBox(height: 20.v), Text("Degree", style: theme.textTheme.titleSmall), SizedBox(height: 7.v), CustomDropDown(hintText: "Ex: Bachelor", items: dropdownItemList, contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v)), SizedBox(height: 20.v), Text("Field of study", style: theme.textTheme.titleSmall), SizedBox(height: 7.v), _buildFieldOfStudyEditText(context), SizedBox(height: 18.v), Text("Start Date", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildEndDateRow(context, smallLabelRegular: "Select Date"), SizedBox(height: 18.v), Text("End Date", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildEndDateRow(context, smallLabelRegular: "Select Date"), SizedBox(height: 18.v), Text("Grade", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildGradeEditText(context), SizedBox(height: 20.v), Text("Description", style: theme.textTheme.titleSmall), SizedBox(height: 7.v), _buildDescriptionEditText(context)]))))])), bottomNavigationBar: _buildSaveChangesButton(context))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 48.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgComponent1, margin: EdgeInsets.only(left: 24.h, top: 13.v, bottom: 13.v), onTap: () {onTapArrowBack(context);}), centerTitle: true, title: AppbarTitle(text: "Add New Education")); } 
/// Section Widget
Widget _buildSchoolEditText(BuildContext context) { return CustomTextFormField(controller: schoolEditTextController, hintText: "Ex: Harvard University"); } 
/// Section Widget
Widget _buildFieldOfStudyEditText(BuildContext context) { return CustomTextFormField(controller: fieldOfStudyEditTextController, hintText: "Ex: Business"); } 
/// Section Widget
Widget _buildGradeEditText(BuildContext context) { return CustomTextFormField(controller: gradeEditTextController, hintText: "Ex: Business"); } 
/// Section Widget
Widget _buildDescriptionEditText(BuildContext context) { return CustomTextFormField(controller: descriptionEditTextController, hintText: "Lorem ipsun", textInputAction: TextInputAction.done, maxLines: 6, contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v)); } 
/// Section Widget
Widget _buildSaveChangesButton(BuildContext context) { return CustomElevatedButton(text: "Save Changes", margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 37.v), onPressed: () {onTapSaveChangesButton(context);}); } 
/// Common widget
Widget _buildEndDateRow(BuildContext context, {required String smallLabelRegular, }) { return Container(padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder24), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: EdgeInsets.only(top: 2.v), child: Text(smallLabelRegular, style: CustomTextStyles.titleMediumBluegray400.copyWith(color: appTheme.blueGray400))), CustomImageView(imagePath: ImageConstant.imgCalendar, height: 24.adaptSize, width: 24.adaptSize)])); } 

/// Navigates back to the previous screen.
onTapArrowBack(BuildContext context) { Navigator.pop(context); } 
/// Navigates to the experienceSettingScreen when the action is triggered.
onTapSaveChangesButton(BuildContext context) { Navigator.pushNamed(context, AppRoutes.experienceSettingScreen); } 
 }
