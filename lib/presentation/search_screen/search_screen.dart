import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_leading_image.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_title.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_trailing_image.dart';import 'package:sulaman_s_application007/widgets/custom_search_view.dart';import 'widgets/searchlist_item_widget.dart';import 'package:flutter/material.dart';import 'package:sulaman_s_application007/core/app_export.dart';
// ignore_for_file: must_be_immutable
class SearchScreen extends StatelessWidget {SearchScreen({Key? key}) : super(key: key);

TextEditingController searchController = TextEditingController();

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: SizedBox(width: SizeUtils.width, child: SingleChildScrollView(padding: EdgeInsets.only(top: 30.v), child: Container(padding: EdgeInsets.symmetric(horizontal: 24.h), child: Column(children: [CustomSearchView(controller: searchController, hintText: "Search..."), SizedBox(height: 24.v), _buildSearchList(context)])))))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 48.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgComponent1, margin: EdgeInsets.only(left: 24.h, top: 13.v, bottom: 13.v), onTap: () {onTapImage(context);}), centerTitle: true, title: AppbarTitle(text: "Find Jobs"), actions: [AppbarTrailingImage(imagePath: ImageConstant.imgComponent3, margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v))]); } 
/// Section Widget
Widget _buildSearchList(BuildContext context) { return ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: 12.v);}, itemCount: 4, itemBuilder: (context, index) {return SearchlistItemWidget(onTapSettings: () {onTapSettings(context);});}); } 

/// Navigates back to the previous screen.
onTapImage(BuildContext context) { Navigator.pop(context); } 
/// Navigates to the jobDetailsTabContainerScreen when the action is triggered.
onTapSettings(BuildContext context) { Navigator.pushNamed(context, AppRoutes.jobDetailsTabContainerScreen); } 
 }
