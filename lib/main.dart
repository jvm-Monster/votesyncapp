import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:votesyncapp/stateproviders/election_state_notifier.dart';
import 'package:votesyncapp/stateproviders/election_type_state_notifier.dart';
import 'package:votesyncapp/stateproviders/loading_state_provider.dart';
import 'package:votesyncapp/stateproviders/student_state_notifier.dart';
import 'package:votesyncapp/vs_apis/election_api.dart';
import 'package:votesyncapp/vs_apis/election_type_api.dart';
import 'package:votesyncapp/vs_apis/student_api.dart';
import 'package:votesyncapp/vs_models/election_model.dart';
import 'package:votesyncapp/vs_models/student_model.dart';
import 'package:votesyncapp/vs_screens/home_screen.dart';
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

/*void main() async{

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
} */

void main() => runApp(
      ProviderScope(
        child: DevicePreview(
          enabled: true,
          builder: (context) => const MyApp(), // Wrap your app
        ),
      ),
    );

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    loadAllDataNeeded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final apt = ref.watch(themeModeProvider);
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 500, name: MOBILE),
                  const Breakpoint(start: 501, end: 900, name: TABLET),
                  const Breakpoint(start: 901, end: 1920, name: DESKTOP),
                  const Breakpoint(
                      start: 1921, end: double.infinity, name: '4K'),
                ],
              ),
          title: 'Flutter Demo',
          theme: apt == true ? VSTheme.darkTheme() : VSTheme.lightTheme(),
          home: const NetworkDisplayWidget(child:HomeScreen())),
    );
  }

  loadAllDataNeeded() async {
    try {
      Student student = Student.fromJson(await StudentApi.getStudentModel());
      List<Election> elections = await ElectionApi.getElections();
      List<String> electionTypes = await ElectionTypeApi.getElectionTypes();
      ref
          .read(studentProvider.notifier)
          .updateStudent(student);
    /*  ref
          .read(electionListProvider.notifier)
          .setElections(elections);*/

      ref
          .read(electionTypeProvider.notifier)
          .setElections(await ElectionTypeApi.getElections(student.school!.schoolId,'AUSA'));

      ref
          .read(electionTypeStateProvider.notifier)
          .update((state) => electionTypes);

    } catch (e) {
      print(e);
    }
  }
}



/*
colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),*/
