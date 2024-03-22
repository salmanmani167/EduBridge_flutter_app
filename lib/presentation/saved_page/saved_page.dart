import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_leading_image.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_title.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_trailing_image.dart';import 'widgets/savedlist_item_widget.dart';import 'package:flutter/material.dart';import 'package:sulaman_s_application007/core/app_export.dart';class SavedPage extends StatelessWidget {const SavedPage({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(appBar: _buildAppBar(context), body: Padding(padding: EdgeInsets.only(left: 24.h, top: 30.v, right: 24.h), child: ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: 12.v);}, itemCount: 4, itemBuilder: (context, index) {return SavedlistItemWidget(onTapBag: () {onTapBag(context);});})))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 48.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgComponent1, margin: EdgeInsets.only(left: 24.h, top: 13.v, bottom: 13.v), onTap: () {onTapImage(context);}), centerTitle: true, title: AppbarTitle(text: "Saved"), actions: [AppbarTrailingImage(imagePath: ImageConstant.imgComponent3, margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v))]); } 

/// Navigates back to the previous screen.
onTapImage(BuildContext context) { Navigator.pop(context); } 
/// Navigates to the jobDetailsTabContainerScreen when the action is triggered.
onTapBag(BuildContext context) { Navigator.pushNamed(context, AppRoutes.jobDetailsTabContainerScreen); } 
 }
