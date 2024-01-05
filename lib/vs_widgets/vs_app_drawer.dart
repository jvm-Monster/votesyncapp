
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/main.dart';
import 'package:votesyncapp/vs_screens/help_screen.dart';
import 'package:votesyncapp/vs_widgets/student_name_widget.dart';

import '../vs_constants/vs_constants.dart';

class VSAppDrawer extends ConsumerStatefulWidget {
  const VSAppDrawer({super.key});

  @override
  ConsumerState createState() => _VSAppDrawerState();
}

class _VSAppDrawerState extends ConsumerState<VSAppDrawer> {
  bool val = false;
  bool dropDownNotification=false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: StudentInfoWidget.studentName(context,const TextStyle(
                fontSize: vsBM,

                fontWeight: FontWeight.bold

            ),),
            accountEmail:StudentInfoWidget.studentEmail(context,const TextStyle(
                fontSize: vsBS,

                fontWeight: FontWeight.bold

            ),),

            currentAccountPicture: CircleAvatar(
              child: Image.asset(
                  vsCreateAccountImage,
              )
            ),
            decoration: const BoxDecoration(color: vsSecondaryColor),
          ),
          appDrawerActions(const Icon(Icons.logout), const Text("Sign out"),
              function: () {}),
          appDrawerActions(
              const Icon(Icons.color_lens), const Text("App Theme"),
              function: () {
            setState(() {
              val = !val;
            });
          }),
          val == true
              ? Column(
                children: [
                  themeModeButtonSwitches(mode: const Text("Dark mode",style: TextStyle(
                    color: Colors.grey
                  ),),
                      iconMode: const Icon(Icons.dark_mode), function: () {
                        ref.read(themeModeProvider.notifier).update((state) => true);
                      },v: true,provider: themeModeProvider),

                  themeModeButtonSwitches(mode: const Text("Light mode",style: TextStyle(
                    color: Colors.grey
                  ),),
                      iconMode: const Icon(Icons.light_mode,color: Colors.yellow,), function: () {
                        ref.read(themeModeProvider.notifier).update((state) => false);
                      },v: false,provider: themeModeProvider)
                ],
              )
              : Container(),
          appDrawerActions(
              const Icon(Icons.circle_notifications_outlined),
              const Text(
                "Notification Settings",
              ),
              function: () {
                setState(() {
                  dropDownNotification=!dropDownNotification;
                });
              }),
          dropDownNotification==true?Column(
            children: [
             themeModeButtonSwitches(mode: const Text("Enable",style: TextStyle(
               color: Colors.grey
             ),),
                 iconMode: const Icon(Icons.notifications_active,color: Colors.grey,),
                 function: (){

                   ref.read(disableNotificationProvider.notifier).update((state) => true);
                 }, v: true,provider: disableNotificationProvider
             ),

              themeModeButtonSwitches(mode: const Text("Disable",style: TextStyle(
                color:Colors.grey
              ),),
                  iconMode: const Icon(Icons.notifications_off_outlined,color: Colors.grey,),
                  function: (){
                    ref.read(disableNotificationProvider.notifier).update((state) => false);

                  }, v: false,provider: disableNotificationProvider
              )

            ],
          )
              :Container(),
          appDrawerActions(const Icon(Icons.help), const Text("Help?"),
              function: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen(),));
              }),
          appDrawerActions(
              const Icon(Icons.add_task,), const Text("Send a feedback?"),
              function: () {
                showFeedBackInput();
              })
        ],
      ),
    ));
  }

  Widget appDrawerActions(Icon icon, Text buttonText,
      {required Function function}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          icon,
          TextButton(
              onPressed: () {
                function();
              },
              child: buttonText)
        ],
      ),
    );
  }

  Widget themeModeButtonSwitches({required Text mode,required Icon iconMode, required Function function,required bool v,provider}){
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              function();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                ref.watch(provider)==v?vsPrimaryColor:null
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mode,
                iconMode
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget disableNotification({required Text text,required Icon icon, required Function function,required bool v}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              function();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    ref.watch(disableNotificationProvider)==v?vsPrimaryColor:null
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text,
                icon
              ],
            ),
          )
        ],
      ),
    );
  }

  showFeedBackInput(){
    return showDialog(
      context: context, builder: (context) {
      return AlertDialog(

        title: const Text("Write Your FeedBack Here",style: TextStyle(
            fontSize: vsBM
        ),),
        content: const TextField(
          style: TextStyle(
            fontSize: vsBS
          ),
          maxLines: 5,
          maxLength: 200,
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Send FeedBack"))
        ],
      );
    },);
  }
}
