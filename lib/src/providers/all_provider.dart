

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_system_admin/src/controllers/theme_controller.dart';

final themeProvider=ChangeNotifierProvider<ThemeController>((ref) => ThemeController());