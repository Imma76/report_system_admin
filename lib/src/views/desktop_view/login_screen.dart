import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:report_system_admin/src/providers/all_provider.dart';

import '../../utils/constants.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const route ='desktop_login';
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = ref.read(themeProvider);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(30),
            Center(child: Image.asset('assets/admin_login.jpg',height: 300,width:300,)),
            Text('LOGIN',style: appTheme.textStyle.copyWith(color: black),),
            Gap(50),
            SizedBox(
                width:500,
                height:100,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder()
                  ),
                )),
            SizedBox(
                width:500,
                height:100,
                child: TextFormField(  decoration: InputDecoration(
                  hintText: 'password',
                    border: OutlineInputBorder()
                ),)),
            Gap(30),

            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(500,50),
                    minimumSize: Size(500,50)

                ),
                child: Text('CONTINUE',style: appTheme.textStyle.copyWith(color: white),))
          ],
        ),
      ),
    );
  }
}