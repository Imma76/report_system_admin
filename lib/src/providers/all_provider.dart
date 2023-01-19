

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_system_admin/src/controllers/central_state.dart';
import 'package:report_system_admin/src/controllers/home_controller.dart';
import 'package:report_system_admin/src/controllers/theme_controller.dart';
import 'package:report_system_admin/src/controllers/user_controller.dart';

final themeProvider=ChangeNotifierProvider<ThemeController>((ref) => ThemeController());
final userProvider=ChangeNotifierProvider<UserController>((ref) => UserController());
final centralStateController=ChangeNotifierProvider<CentralState>((ref) => CentralState());
final homeController=ChangeNotifierProvider<HomeController>((ref) => HomeController());
