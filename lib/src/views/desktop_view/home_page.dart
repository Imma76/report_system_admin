import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:report_system_admin/src/providers/all_provider.dart';

import '../../utils/constants.dart';


class DesktopHomePage extends ConsumerStatefulWidget {
  const DesktopHomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<DesktopHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final appTheme  = ref.read(themeProvider);

  }
  @override
  Widget build(BuildContext context) {
    final appTheme  = ref.watch(themeProvider);
    return Scaffold(
      body:Row(
        children: [

          Expanded(
            child: Container(
              height:MediaQuery.of(context).size.height,
             // color: primaryColor,
              child: Column(
                children:[
                  Gap(30),
                  Material(
                    type: MaterialType.transparency,
                    child: MenuWidget(title: 'Home',),
                  ),
                  Material(
                    type: MaterialType.transparency,
                    child: MenuWidget(title: 'Treated Reports',),
                  ),
                  Material(
                    type: MaterialType.transparency,
                    child: MenuWidget(title: 'Add an admin',),
                  ),

                ],
                
              ),
            ),
          ),
         Container(width: 5,color:dividerColor),
         Expanded(
           flex: 3,
           child: Column(
             children: [
               Gap(20),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                 CircleAvatar(
                   radius:75,
                   child: LiquidCircularProgressIndicator(
                     value: 0.5, // Defaults to 0.5.
                     valueColor: AlwaysStoppedAnimation(Colors.black), // Defaults to the current Theme's accentColor.
                     backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
                     borderColor: primaryColor,
                     borderWidth: 5.0,
                     direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                     center: Column(
                       mainAxisAlignment:MainAxisAlignment.center,
                       children: [
                         Text(''),
                         Gap(5),
                         Text(' REPORTS SUBMITTED ',),
                       ],
                     ),
                   ),
                 ),
                 CircleAvatar(
                   radius:75,
                   child: LiquidCircularProgressIndicator(
                     value: 0.5, // Defaults to 0.5.
                     valueColor: AlwaysStoppedAnimation(Colors.black), // Defaults to the current Theme's accentColor.
                     backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
                     borderColor: primaryColor,
                     borderWidth: 5.0,
                     direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                     center: Column(
                       mainAxisAlignment:MainAxisAlignment.center,
                       children: [
                         Text(''),
                         Gap(5),
                         Text(' REPORTS SUBMITTED ',),
                       ],
                     ),
                   ),
                 ),

                 CircleAvatar(
                   radius:75,
                   child: LiquidCircularProgressIndicator(
                     value: 0.5, // Defaults to 0.5.
                     valueColor: AlwaysStoppedAnimation(Colors.black), // Defaults to the current Theme's accentColor.
                     backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
                     borderColor: primaryColor,
                     borderWidth: 5.0,
                     direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                     center: Column(
                       mainAxisAlignment:MainAxisAlignment.center,
                       children: [
                         Text(''),
                         Gap(5),
                         Text(' REPORTS SUBMITTED ',),
                       ],
                     ),
                   ),
                 ),
               ],),
               Gap(50),
               Text('Submitted Reports',style: appTheme.textStyle.copyWith(color: black),)
             ],
           ),
         ),
          Container(width: 5,color:dividerColor),
          Expanded(
            child: Container(
              height:MediaQuery.of(context).size.height,
            child:Column(children: [
              Gap(10),
              Text('Reports In review',style: appTheme.textStyle.copyWith(color: black),),
              ListView.builder(
                  shrinkWrap:true,
                  itemCount: 10,
                  itemBuilder: (context,index){
                return ListTile(title:Text('Report',style: appTheme.textStyle.copyWith(color: black),));
              })
            ],)
            //  color: primaryColor,
            ),
          ),
        ],
      )
    );
  }
}

class MenuWidget extends StatelessWidget {
  final String title;
  const MenuWidget({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      hoverColor: primaryColor.withOpacity(0.5),
    //  selected: true,
    //  tileColor: Colors.amber,
      title:Text(title,style: GoogleFonts.lora(),),
    );
  }
}
