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
  void initState() {
    // TODO: implement initState
    super.initState();
    final userController = ref.read(userProvider);
  }
  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(themeProvider);
    final userController = ref.watch(userProvider);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(30),
            Center(child: Image.asset('assets/admin_login.jpg',height: 300,width:300,)),
            Text('LOGIN',style: appTheme.textStyle.copyWith(color: black),),
            const Gap(50),
            SizedBox(
                width:500,
                height:100,
                child: TextFormField(
                  controller: userController.emailController,
                  decoration: const InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder()
                  ),
                )),
            SizedBox(
                width:500,
                height:100,
                child: TextFormField(
                  controller: userController.passwordController,
                  decoration: const InputDecoration(
                  hintText: 'password',
                    border: const OutlineInputBorder()
                ),)),
            const Gap(30),

           userController
            .loading?const Center(child: const CircularProgressIndicator()):ElevatedButton(onPressed: (){
              userController.loginAdmin();
           },
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size(500,50),
                    minimumSize: const Size(500,50)

                ),
                child: Text('CONTINUE',style: appTheme.textStyle.copyWith(color: white),))
          ],
        ),
      ),
    );
  }
}
