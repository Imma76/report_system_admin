import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

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
  Widget build(BuildContext context) {

    return Scaffold(
      body:Row(
        children: [

          Expanded(
            child: Container(
              height:MediaQuery.of(context).size.height,
              color: primaryColor,
              child: Column(
                children:[
                  Gap(30),
                  ListTile(
                    title:Text('Home'),
                  ),
                ],
                
              ),
            ),
          ),
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
             ],
           ),
         ),
          Expanded(
            child: Container(
              height:MediaQuery.of(context).size.height,
              color: primaryColor,
            ),
          ),
        ],
      )
    );
  }
}
