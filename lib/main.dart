import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/vs_screens/login_screen.dart';
import 'package:votesyncapp/vs_screens/splash_screen.dart';
import 'package:votesyncapp/vs_theme/vs_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:votesyncapp/vs_widgets/network_display_widget.dart';

// final nameProvider = Provider<String>((ref)=>'Bolaji');
// final nameProvider = StateProvider<String?>((ref) => null);
// final userProvider = StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());

final themeModeProvider = StateProvider<bool?>((ref) => false);
final disableNotificationProvider = StateProvider<bool?>((ref) => false);
final filterByProvider = StateProvider<String?>((ref) => "");

void main() async{

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
} 

// void main() => runApp(
//       ProviderScope(
//         child: DevicePreview(
//           enabled: true,
//           builder: (context) => const MyApp(), // Wrap your app
//         ),
//       ),
//     );

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    /*loadAllDataNeeded();*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final apt = ref.watch(themeModeProvider);
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
         /* builder: (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 500, name: MOBILE),
                  const Breakpoint(start: 501, end: 900, name: TABLET),
                  const Breakpoint(start: 901, end: 1920, name: DESKTOP),
                  const Breakpoint(
                      start: 1921, end: double.infinity, name: '4K'),
                ],
              ),*/
          title: 'Flutter Demo',
          theme: apt == true ? VSTheme.darkTheme() : VSTheme.lightTheme(),
          home: const NetworkDisplayWidget(child: LoadingScreen())),
    );
  }

/*  loadAllDataNeeded() async {
    try {
      Student student = Student.fromJson(await StudentApi.getStudentModel());
    
      ref
          .read(studentProvider.notifier)
          .updateStudent(student);
      // ref
      //     .read(electionListProvider.notifier)
      //     .setElections(await ElectionApi.getElections());

      ref
          .read(electionTypeProvider.notifier)
          .setElections(await ElectionTypeApi.getElections(student.school!.schoolId));
    } catch (e) {
      print(e);
    }
  }*/
}



/*
colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),*/
