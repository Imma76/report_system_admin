import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide ModalBottomSheet;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:report_system_admin/src/providers/all_provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../main.dart';
import '../../model/report_model.dart';
import '../../utils/constants.dart';


class DesktopHomePage extends ConsumerStatefulWidget {
  static const route='desktop_home';
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
    final homeProvider=ref.read(homeController);

  }
  @override
  Widget build(BuildContext context) {
    final appTheme  = ref.watch(themeProvider);
    final homeProvider=ref.watch(homeController);
    return Scaffold(
      body:StreamBuilder<QuerySnapshot>(
        stream:homeProvider.reportStream(),
        builder: (context, snapshot) {

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!.docs;
          int reviewCount= 0;

          int resolvedCount=0;
      //    final report=Reports.fromJson(data[index].data() as Map<String,dynamic>);
         for(var docData in data){
           final report1=docData.data() as Map<String,dynamic>;

           if(report1['reportStatus']==ReportStatus.inReview){
             reviewCount++;
           }

           if(report1['reportStatus']==ReportStatus.resolved){
             resolvedCount++;
           }

         }

          return  Row(
            children: [
             Container(width: 5,color:dividerColor),
             Expanded(
               flex: 3,
               child: Column(
                 children: [
                   Gap(20),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                         height: 150,
                         width:300,
                         padding: EdgeInsets.only(right: 20,left: 20,bottom: 10),
                         
                         decoration:
                         BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3), boxShadow: const [
                           BoxShadow(
                             offset: Offset(0, 13),
                             blurRadius: 25,
                             color: Color.fromARGB(14, 14, 14, 0),
                           ),
                         ],),
                           child:Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Spacer(),
                               Image.asset("assets/report3.png",height: 30,width: 30,),
                               Gap(10),
                               Text('Total Reports',style: GoogleFonts.dmSans(color: black),),
                               Gap(5),
                               Text(data.length.toString(),style:  GoogleFonts.dmSans(color: black),),

                             ],
                           ),
                       ), Container(
                         height: 150,
                         width:300,
                         padding: EdgeInsets.only(right: 20,left: 20,bottom: 10),  decoration:
                       BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3), boxShadow: const [
                         BoxShadow(
                           offset: Offset(0, 13),
                           blurRadius: 25,
                           color: Color.fromARGB(14, 14, 14, 0),
                         ),
                       ],),
                         child:Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Spacer(),
                             Image.asset("assets/report3.png",height: 30,width: 30,),
                             Gap(10),
                             Text('Reports in review',style:  GoogleFonts.dmSans(color: black),),
                             Gap(5),
                             Text(reviewCount.toString(),style:  GoogleFonts.dmSans(color: black),),

                           ],
                         ),
                       ), Container(
                         height: 150,
                         width:300,
                         padding: EdgeInsets.only(right: 20,left: 20,bottom: 10),    decoration:
                       BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3), boxShadow: const [
                         BoxShadow(
                           offset: Offset(0, 13),
                           blurRadius: 25,
                           color: Color.fromARGB(14, 14, 14, 0),
                         ),
                       ],),
               child:Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Spacer(),
                   Image.asset("assets/report3.png",height: 30,width: 30,),
                   Gap(10),
                   Text('Resolved reports',style:  GoogleFonts.dmSans(color: black),),
                   Gap(5),
                   Text(resolvedCount.toString(),style: GoogleFonts.dmSans(color: black),),

                 ],
               ),
                       )

                   ],),
                   Gap(50),
                   Expanded(
                     child: Container(
                         height:MediaQuery.of(context).size.height,

                         child:Column(children: [
                           Gap(10),
                           Text('Total reports',style: GoogleFonts.dmSans(color: black),),
                           ListView.builder(
                               shrinkWrap:true,
                               itemCount: data.length,
                               itemBuilder: (context,index){
                                 Map<String,dynamic> dataMap = data[index].data() as Map<String,dynamic>;
                                 dataMap['id'] = data[index].id;
                                 final report=Reports.fromJson(dataMap);

                                 return GestureDetector(
                                   onTap:(){

                                     showCupertinoModalBottomSheet(context: context, builder: (context){

                                       return  ReportDetails(reports: report,);
                                     });
                                   },
                                   child: ListTile(title: SizedBox(
                                       width: 200,
                                       child: Text(report.report.toString(),overflow: TextOverflow.ellipsis,style: GoogleFonts.dmSans(),)),subtitle: Text(
                                   Jiffy(report.createdAt.toString()).format("MMMM do yyyy, h:mm:ss a")


                                   ),trailing: GestureDetector(
                                     onTap: (){

                                       showDialog(context: context, builder: (context) {
                                         return StatefulBuilder(
                                           builder: (context,widget) {
                                             return Dialog(
                                               backgroundColor:
                                               Colors.white,

                                               child: Container(
                                                 decoration: BoxDecoration(color:
                                              Colors.white, borderRadius: BorderRadius.circular(10)),
                                                 height:
                                                 200,
                                                 width: 382,

                                                 child:homeProvider.load?Center(child: const CircularProgressIndicator()): Column(
                                                   children: [
                                                     Gap(22),
                                                     GestureDetector(
                                                       onTap: ()async{
                                                         widget(() {

                                                         });

                                                         if(report.reportStatus != ReportStatus.submitted){
                                                           report.reportStatus= ReportStatus.submitted;
                                                           await homeProvider.updateReportStatus(report);

                                                         }Navigator.pop(context);
                                                       },
                                                       child: SizedBox(
                                                         height: 40,
                                                         child: Center(
                                                           child: Text('Submitted',textAlign: TextAlign.center,
                                                             style: GoogleFonts.dmSans(
                                                                 color: Colors.black,
                                                                 fontSize: 16,
                                                                 fontWeight: FontWeight.w500),),
                                                         ),
                                                       ),
                                                     ),
                                                     GestureDetector(
                                                       onTap: ()async{
                                                         widget(() {

                                                         });
                                                         if(report.reportStatus != ReportStatus.inReview){
                                                           report.reportStatus= ReportStatus.inReview;
                                                           await homeProvider.updateReportStatus(report);

                                                         }Navigator.pop(context);
                                                       },
                                                       child: SizedBox(
                                                         height: 40,
                                                         child: Center(
                                                           child: Text('In Review',textAlign: TextAlign.center,
                                                             style: GoogleFonts.dmSans(
                                                                 color: Colors.black,
                                                                 fontSize: 16,
                                                                 fontWeight: FontWeight.w500),),
                                                         ),
                                                       ),
                                                     ),
                                                     GestureDetector(
                                                       onTap: ()async{
                                                         widget(() {

                                                         });
                                                         if(report.reportStatus != ReportStatus.resolved){
                                                           report.reportStatus= ReportStatus.resolved;
                                                           await homeProvider.updateReportStatus(report);

                                                         }Navigator.pop(context);
                                                       },
                                                       child: SizedBox(
                                                         height: 40,
                                                         child: Center(
                                                           child: Text('Resolved',textAlign: TextAlign.center,
                                                             style: GoogleFonts.dmSans(
                                                                 color: Colors.black,
                                                                 fontSize: 16,
                                                                 fontWeight: FontWeight.w500),),
                                                         ),
                                                       ),
                                                     ),
                                                     GestureDetector(
                                                       onTap: ()async{
                                                         widget(() {

                                                         });

                                                         Navigator.pop(context);

                                                         showModalBottomSheet(context: context, builder: (context){

                                                           return Container(
                                                             child: Padding(
                                                               padding: const EdgeInsets.all(8.0),
                                                               child: Column(children: [
                                                                 Text('Send Notification'),
                                                                 Gap(20),
                                                                 TextField(
                                                                   controller: homeProvider.title
                                                                   ,
                                                                   maxLines: 1,
                                                                   decoration: InputDecoration(
                                                                     enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey)),
                                                                     focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey)),
                                                                     hintText: 'Title ',
                                                                     border: OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey)),
                                                                   ),),
Gap(20),
                                                                 TextField(
                                                                   controller:homeProvider.message,
                                                                   maxLines: 5,
                                                                   decoration: InputDecoration(
                                                                     enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                                                     focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey)),
                                                                     hintText: 'message',
                                                                     border: OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey)),
                                                                   ),),
                                                                 Gap(40),
                                                                 homeProvider


                                                                     .loadNotif

                                                                     ?const Center(child: const CircularProgressIndicator()):  ElevatedButton(onPressed: ()async{

                                                                  await homeProvider.pushNotification(fcmToken:
                                                                   report.fcmToken);

                                                                  Navigator.pop(context);
                                                                  // userController.loginAdmin();
                                                                 },
                                                                     style: ElevatedButton.styleFrom(
                                                                         maximumSize: const Size(500,50),
                                                                         minimumSize: const Size(500,50)

                                                                     ),
                                                                     child: Text('CONTINUE',style: appTheme.textStyle.copyWith(color: white),))

                                                               ],),
                                                             ),
                                                           );
                                                         });

                                                       },
                                                       child: SizedBox(
                                                         height: 40,
                                                         child: Center(
                                                           child: Text('Send message',textAlign: TextAlign.center,
                                                             style: GoogleFonts.dmSans(
                                                                 color: Colors.black,
                                                                 fontSize: 16,
                                                                 fontWeight: FontWeight.w500),),
                                                         ),
                                                       ),
                                                     ),


                                                     // ElevatedButton(onPressed: () async {
                                                     //
                                                     //   Navigator.pop(navigatorKey!
                                                     //       .currentContext!,);
                                                     // },
                                                     //   child: Text('Okay', style: GoogleFonts.poppins(
                                                     //       color: AppTheme.white,
                                                     //       fontSize: 20.sp,
                                                     //       fontWeight: FontWeight.w700),),
                                                     //   style: ElevatedButton.styleFrom(primary: AppTheme.primary,
                                                     //       minimumSize: Size(108, 48),
                                                     //       shape: RoundedRectangleBorder(
                                                     //           borderRadius: BorderRadius.circular(10))),),
                                                   ],
                                                 ),
                                               ),

                                             );
                                           }
                                         );
                                       });

                                     },
                                     child: Container(
                                       width: 100,height: 30,
                                     decoration: BoxDecoration(
                                     color: Color(0xff7AAEFF),

                                     borderRadius: BorderRadius.circular(3)),
                                     child:Padding(
                                     padding: const EdgeInsets.all(5.0),
                                     child: Center(child: Text(report.reportStatus.toString(),style: TextStyle(color: Colors.white),)),
                                     ),),
                                   )),
                                 );
                               })
                         ],)
                       //  color: primaryColor,
                     ),
                   ),
                 ],
               ),
             ),
              Container(width: 5,color:dividerColor),

            ],
          );
        }
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


class ReportDetails extends ConsumerWidget {
  final Reports reports;
  const ReportDetails({
    Key? key, required this.reports
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme  = ref.read(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Details - ${ Jiffy(reports.createdAt.toString()).format("MMMM do yyyy, h:mm:ss a")}',style: appTheme.textStyle.copyWith(color: black),),
        backgroundColor: Colors.transparent,elevation: 0,actions: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.close,color: Colors.black,))
      ],),
      body: Padding(
        padding: const EdgeInsets.only(left:20.0),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
        children: [
          Gap(20),
          Text('Report Description',style: GoogleFonts.dmSans(color: black,fontWeight: FontWeight.bold),),
          Gap(20),
          Text('${reports.report}',style: GoogleFonts.dmSans(color: black,fontWeight: FontWeight.w400,height: 2),),
          Gap(30),
          Text('Attached Image',style: appTheme.textStyle.copyWith(color: black,fontWeight: FontWeight.bold)),
          Text('Attached Video',style: appTheme.textStyle.copyWith(color: black,fontWeight: FontWeight.bold)),
          Text('Attached Audio',style: appTheme.textStyle.copyWith(color: black,fontWeight: FontWeight.bold)),
        ],
    ),
      ),);
  }
}