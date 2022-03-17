import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../../../core/utils/ui/ui_utils.dart';
import '../../setting_screen.dart';
import 'profile_bottom_sheet.dart';

class MyAppBar {
  static PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(TernavIcons.light.home)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
      title: SvgPicture.asset(
        UiUtils.themeAsset(context: context, assetLocation: "logo.svg"),
        width: 100.0,
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => SettingScreen()),
            );
          },
          child: Icon(TernavIcons.bold.settings_2),
        ),
        InkWell(
          child: Icon(TernavIcons.bold.profile),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) => const ProfileBottomSheet(),
            );
          },
        )
      ],
    );
  }
}
