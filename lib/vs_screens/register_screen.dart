import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/stateproviders/school_state_providers.dart';
import 'package:votesyncapp/vs_apis/student_api.dart';
import 'package:votesyncapp/vs_models/school_model.dart';
import 'package:votesyncapp/vs_screens/login_screen.dart';
import 'package:votesyncapp/vs_utils/api_status_codes.dart';
import 'package:votesyncapp/vs_widgets/election_dropdown_button_widget.dart';

import '../vs_constants/vs_constants.dart';
import '../vs_models/student_model.dart';
import '../vs_widgets/vs_inputform_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _studentFullNameController = TextEditingController();
  final TextEditingController _studentEmailController = TextEditingController();
  final TextEditingController _studentMatrixNumberController = TextEditingController();
  final TextEditingController _studentPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  dynamic selectedSchool;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       /* appBar: AppBar(
          automaticallyImplyLeading: true,
        ),*/
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      "Create An Account",
                      style: TextStyle(
                          fontSize:vsHLS,
                          ),
                    ),
                    /* Text(
                          "Register as an Adeleke student and a voter"
                          "\nto vote for your preferred candidate",
                          style: TextStyle(fontSize: vsBS),
                        )*/

                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          VSInputFormWidget(
                            prefixIcon: const Icon(Icons.person),
                            labelText: "Full Name",
                            inputController: _studentFullNameController,
                            validate: (String value) {
                              if (value.length < 4) {
                                return "Name not found";
                              } else {
                                return null;
                              }
                            },
                            obscurePassword: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Consumer(builder: (context, ref, child) {
                            final watchSchoolList=ref.watch(schoolListProvider);
                            return  AppDropDownButtonWidget(listOptions:watchSchoolList!,onValueChanged: (value) {
                                selectedSchool = value;
                              // Update the selectedSchool variable whenever the value changes
                            },);
                          },),

                          const SizedBox(
                            height: 10,
                          ),
                          VSInputFormWidget(
                            prefixIcon: const Icon(Icons.email),
                            labelText: "Student Email (example@AU.EDU",
                            inputController: _studentEmailController,
                            validate: (String value) {
                              if (value.length < 4) {
                                return "Invalid email";
                              } else {
                                return null;
                              }
                            },
                            obscurePassword: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          VSInputFormWidget(
                            prefixIcon: const Icon(Icons.numbers),
                            labelText: "Matrix Number",
                            inputController: _studentMatrixNumberController,
                            validate: (String value) {
                              if (value.length < 4) {
                                return "Matrix Number not found";
                              } else {
                                return null;
                              }
                            },
                            obscurePassword: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          VSInputFormWidget(
                            prefixIcon: const Icon(Icons.password),
                            labelText: "Password",
                            inputController: _studentPasswordController,
                            validate: (String value) {
                              if (value.length < 4) {
                                return "Incorrect password";
                              } else {
                                return null;
                              }
                            },
                            obscurePassword: true,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.min, // Ensure the column takes minimum vertical space
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "By clicking sign up button you agree with our",
                          style: TextStyle(
                            fontSize: vsBS,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Terms and Conditions",
                          style: TextStyle(
                            color: vsPrimaryColor,
                            fontSize: vsBS,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(vsPrimaryColor)),
                                onPressed: ()=>signUp(context),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),

                            Row(
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(fontSize: vsBS),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const LoginScreen(),
                                          ));
                                    },
                                    child: const Text("Sign In",
                                        style: TextStyle(
                                            fontSize: vsBS,
                                            decoration: TextDecoration.underline))),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
 void signUp(context) async {

    try{
      if (_formKey.currentState!.validate()) {
        showCustomDialog(context);
        School school = selectedSchool;
        // Create a Student object using the input values
        Student newStudent = Student(
          _studentMatrixNumberController.text, // studentId can be null or initialized based on your logic
          _studentFullNameController.text,
          _studentEmailController.text,
          _studentPasswordController.text,
          null,
          school,
        );

        // we can use the newStudent object as needed, and send it to the API
        int creationStatus = await StudentApi.createNewStudentModel(newStudent);
        print(creationStatus);
        // Check the status and show Snackbars accordingly
        if (creationStatus == vsCreated) {

          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              content: Text('Student created successfully'),
              duration: Duration(seconds: 4),
            ),
          );
        } else if (creationStatus == vsConflict) {

          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text('Student already exists.'),
              duration: Duration(seconds: 4),
            ),
          );
        } else if (creationStatus == requestTimeout) {

          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Request timeout. Please try again.'),
              duration: Duration(seconds: 4),
            ),
          );
        } else {

          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('An error occurred. Please try again.'),
              duration: Duration(seconds: 4),
            ),
          );
        }

        // printing the JSON representation of the newStudent for debugging
        print(newStudent.toJson());
      }

    }catch(error){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text('Please fill in all data'),
          duration: Duration(seconds: 4),
        ),
      );
    }

  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            content: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }

}
