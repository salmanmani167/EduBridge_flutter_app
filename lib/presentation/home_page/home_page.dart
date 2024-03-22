import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';
import 'package:sulaman_s_application007/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:sulaman_s_application007/widgets/app_bar/appbar_subtitle.dart';
import 'package:sulaman_s_application007/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:sulaman_s_application007/widgets/app_bar/appbar_trailing_image.dart';
import 'package:sulaman_s_application007/widgets/custom_search_view.dart';
import 'widgets/frame_item_widget.dart';
import 'widgets/settings_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:sulaman_s_application007/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.v),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: CustomSearchView(
                    controller: searchController,
                    hintText: "Search...",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Text(
                  "Recommendation",
                  style: CustomTextStyles.titleMedium18,
                ),
              ),
              SizedBox(height: 17.v),
              _buildFrame(context),
              SizedBox(height: 22.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Text(
                  "Recent Jobs",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 15.v),
              _buildSettings(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 74.h,
      leading: AppbarLeadingCircleimage(
        imagePath: ImageConstant.imgImage50x50,
        margin: EdgeInsets.only(left: 24.h),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 10.h),
        child: Column(
          children: [
            AppbarSubtitle(
              text: "Hi, Welcome Back! 👋",
            ),
            SizedBox(height: 9.v),
            AppbarSubtitleTwo(
              text: "Find your dream job",
              margin: EdgeInsets.only(right: 33.h),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotification,
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 13.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 176.v,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 24.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 16.h,
            );
          },
          itemCount: 2,
          itemBuilder: (context, index) {
            return FrameItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSettings(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: 2,
          itemBuilder: (context, index) {
            return SettingsItemWidget();
          },
        ),
      ),
    );
  }
}
