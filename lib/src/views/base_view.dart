import 'package:flutter/material.dart';
import 'package:report_system_admin/src/views/desktop_view/home_page.dart';
import 'package:responsive_builder/responsive_builder.dart';


class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop:DesktopHomePage(),
      mobile: DesktopHomePage(),
    );
  }
}
