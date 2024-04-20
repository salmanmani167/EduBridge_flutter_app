import 'package:sulaman_s_application007/presentation/home_page/home_page.dart';
import 'package:sulaman_s_application007/presentation/message_page/message_page.dart';
import 'package:sulaman_s_application007/presentation/multi_step_form/multi_step_form.dart';
import 'package:sulaman_s_application007/presentation/saved_page/saved_page.dart';
import 'package:sulaman_s_application007/presentation/profile_page/profile_page.dart';
import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';
import 'package:sulaman_s_application007/widgets/app_bar/appbar_leading_image.dart';
import 'package:sulaman_s_application007/widgets/app_bar/appbar_title.dart';
import 'package:sulaman_s_application007/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sulaman_s_application007/core/app_export.dart';
import 'package:sulaman_s_application007/presentation/logout_popup_dialog/logout_popup_dialog.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 28.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 5.v),
                              padding: EdgeInsets.symmetric(horizontal: 24.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    _buildBannerProgress(context),
                                    SizedBox(height: 32.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Account",
                                            style: CustomTextStyles
                                                .labelLargeSemiBold)),
                                    SizedBox(height: 15.v),
                                    _buildNotification(context,
                                        bellImage: ImageConstant.imgPerson,
                                        notification: "Personal Info",
                                        onTapNotification: () {
                                      onTapNotification(context);
                                    }),
                                    SizedBox(height: 16.v),
                                    Divider(indent: 36.h),
                                    SizedBox(height: 15.v),
                                    _buildLanguage(context,
                                        globe: ImageConstant.imgThumbsUpPrimary,
                                        languageText: "Experience",
                                        onTapLanguage: () {
                                      onTapLanguage(context);
                                    }),
                                    SizedBox(height: 14.v),
                                    Divider(indent: 36.h),
                                    SizedBox(height: 26.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("General",
                                            style: CustomTextStyles
                                                .labelLargeSemiBold)),
                                    SizedBox(height: 15.v),
                                    _buildNotification(context,
                                        bellImage: ImageConstant.imgBell,
                                        notification: "Notification",
                                        onTapNotification: () {
                                      onTapNotification1(context);
                                    }),
                                    SizedBox(height: 16.v),
                                    Divider(indent: 36.h),
                                    SizedBox(height: 15.v),
                                    _buildLanguage(context,
                                        globe: ImageConstant.imgGlobe,
                                        languageText: "Language",
                                        onTapLanguage: () {
                                      onTapLanguage1(context);
                                    }),
                                    SizedBox(height: 14.v),
                                    Divider(indent: 36.h),
                                    SizedBox(height: 15.v),
                                    _buildLanguage(context,
                                        globe: ImageConstant.imgShieldDone,
                                        languageText: "Security"),
                                    SizedBox(height: 14.v),
                                    Divider(indent: 36.h),
                                    SizedBox(height: 26.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("About",
                                            style: CustomTextStyles
                                                .labelLargeSemiBold)),
                                    SizedBox(height: 16.v),
                                    _buildNotification(context,
                                        bellImage: ImageConstant.imgShield,
                                        notification: "Legal and Policies",
                                        onTapNotification: () {
                                      onTapNotification2(context);
                                    }),
                                    SizedBox(height: 15.v),
                                    Divider(indent: 36.h),
                                    SizedBox(height: 16.v),
                                    _buildNotification(context,
                                        bellImage: ImageConstant.imgProfile,
                                        notification: "Help & Feedback"),
                                    SizedBox(height: 17.v),
                                    Divider(indent: 36.h),
                                    SizedBox(height: 16.v),
                                    _buildNotification(context,
                                        bellImage: ImageConstant.imgVideoCamera,
                                        notification: "About Us"),
                                    SizedBox(height: 28.v),
                                    Align(
                                        alignment: Alignment.center,
                                        child: GestureDetector(
                                            onTap: () {
                                              onTapTxtLargeLabelMedium(context);
                                            },
                                            child: Text("Logout",
                                                style: CustomTextStyles
                                                    .titleMediumOnPrimary)))
                                  ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 51.v,
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgComponent1,
            margin: EdgeInsets.only(left: 24.h, top: 13.v, bottom: 14.v),
            onTap: () {
              onTapImage(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Settings"));
  }

  /// Section Widget
  Widget _buildBannerProgress(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 11.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Row(children: [
          Container(
              height: 64.adaptSize,
              width: 64.adaptSize,
              margin: EdgeInsets.only(top: 5.v, bottom: 4.v),
              child: Stack(alignment: Alignment.center, children: [
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 64.adaptSize,
                        width: 64.adaptSize,
                        child: CircularProgressIndicator(
                            value: 0.5, strokeWidth: 4.h))),
                Align(
                    alignment: Alignment.center,
                    child: Text("65%",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer))
              ])),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 8.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profile Completeness",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer),
                    SizedBox(height: 4.v),
                    Opacity(
                        opacity: 0.8,
                        child: SizedBox(
                            width: 185.h,
                            child: Text(
                                "Quality profiles are 5 times more likely to get hired by clients.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .labelLargeOnPrimaryContainer_2
                                    .copyWith(height: 1.67))))
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildNotification(
    BuildContext context, {
    required String bellImage,
    required String notification,
    Function? onTapNotification,
  }) {
    return GestureDetector(
        onTap: () {
          onTapNotification!.call();
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: bellImage,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(top: 2.v)),
              Padding(
                  padding: EdgeInsets.only(left: 12.h, top: 3.v, bottom: 2.v),
                  child: Text(notification,
                      style: CustomTextStyles.titleMediumMedium
                          .copyWith(color: theme.colorScheme.primary))),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRightPrimary,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 2.v))
            ]));
  }

  /// Common widget
  Widget _buildLanguage(
    BuildContext context, {
    required String globe,
    required String languageText,
    Function? onTapLanguage,
  }) {
    return GestureDetector(
        onTap: () {
          onTapLanguage!.call();
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomImageView(
              imagePath: globe,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(top: 2.v, bottom: 1.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 7.v),
                              child: Text(languageText,
                                  style: theme.textTheme.titleMedium!.copyWith(
                                      color: theme.colorScheme.primary))),
                          CustomImageView(
                              imagePath: ImageConstant.imgArrowRightPrimary,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              margin: EdgeInsets.only(bottom: 4.v))
                        ]),
                    SizedBox(height: 14.v),
                    Divider()
                  ])))
        ]));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.FYP:
        return AppRoutes.multiStepForm;
      case BottomBarEnum.Saved:
        return AppRoutes.savedPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.multiStepForm:
        return MultiStepForm();
      case AppRoutes.savedPage:
        return SavedPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapNotification(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Navigates to the experienceSettingScreen when the action is triggered.
  onTapLanguage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.experienceSettingScreen);
  }

  /// Navigates to the notificationsScreen when the action is triggered.
  onTapNotification1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }

  /// Navigates to the languageScreen when the action is triggered.
  onTapLanguage1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.languageScreen);
  }

  /// Navigates to the privacyScreen when the action is triggered.
  onTapNotification2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.privacyScreen);
  }

  /// Displays a dialog with the [LogoutPopupDialog] content.
  onTapTxtLargeLabelMedium(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: LogoutPopupDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
