import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_leading_image.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_title.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_trailing_image.dart';import 'package:sulaman_s_application007/presentation/notifications_general_page/notifications_general_page.dart';import 'package:sulaman_s_application007/presentation/notifications_my_proposals_page/notifications_my_proposals_page.dart';import 'package:flutter/material.dart';import 'package:sulaman_s_application007/core/app_export.dart';class NotificationsMyProposalsTabContainerScreen extends StatefulWidget {const NotificationsMyProposalsTabContainerScreen({Key? key}) : super(key: key);

@override NotificationsMyProposalsTabContainerScreenState createState() =>  NotificationsMyProposalsTabContainerScreenState();

 }

// ignore_for_file: must_be_immutable
class NotificationsMyProposalsTabContainerScreenState extends State<NotificationsMyProposalsTabContainerScreen> with  TickerProviderStateMixin {late TabController tabviewController;

@override void initState() { super.initState(); tabviewController = TabController(length: 2, vsync: this); } 
@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(appBar: _buildAppBar(context), body: SizedBox(width: double.maxFinite, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(height: 27.v), Container(height: 44.v, width: 202.h, margin: EdgeInsets.only(left: 24.h), child: TabBar(controller: tabviewController, labelPadding: EdgeInsets.zero, labelColor: theme.colorScheme.onPrimaryContainer.withOpacity(1), labelStyle: TextStyle(fontSize: 12.fSize, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w600), unselectedLabelColor: appTheme.blueGray400, unselectedLabelStyle: TextStyle(fontSize: 12.fSize, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w600), indicator: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(12.h)), tabs: [Tab(child: Text("General")), Tab(child: Text("My Proposals"))])), SizedBox(height: 644.v, child: TabBarView(controller: tabviewController, children: [NotificationsGeneralPage(), NotificationsMyProposalsPage()]))])))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 97.v, leadingWidth: 48.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgComponent1, margin: EdgeInsets.only(left: 24.h, top: 16.v, bottom: 16.v)), centerTitle: true, title: AppbarTitle(text: "Notifications"), actions: [AppbarTrailingImage(imagePath: ImageConstant.imgComponent3Primary, margin: EdgeInsets.all(16.h), onTap: () {onTapImage(context);})]); } 
/// Navigates to the settingsScreen when the action is triggered.
onTapImage(BuildContext context) { Navigator.pushNamed(context, AppRoutes.settingsScreen); } 
 }
