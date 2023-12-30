import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_screens/register_screen.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';
import 'package:votesyncapp/vs_widgets/vs_inputform_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController studentEmailController = TextEditingController();
  TextEditingController studentPasswordController =TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       /* Image.asset(vsLoginAccountImage,width: MediaQuery.of(context).size.width*0.5,),*/

                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login Account",style: TextStyle(
                            fontSize: vsHLS,
                        ),),

                     /*   Text("Login as an Adeleke student and a voter\n"
                            "to vote for your preferred candidate", style: TextStyle(
                          fontSize: vsBS
                        ),)*/
                      ],
                    ),

                    const SizedBox(height: 30,),
                    Form(
                      key: _formKey,
                      child: Column(

                        children: [

                        VSInputFormWidget(
                            prefixIcon: const Icon(Icons.email),
                            labelText: "Student Email (example@AU.EDU",
                            inputController: studentEmailController,
                            validate: (String value){
                              if(value.length<4){
                                return "Invalid email";
                              }else{
                                return null;
                              }
                            },
                           obscurePassword: false,
                            ),

                          const SizedBox(height: 10,),

                          VSInputFormWidget(
                              prefixIcon: const Icon(Icons.password),
                              labelText: "Password",
                              inputController: studentPasswordController,
                              validate: (String value){
                                if(value.length<4){
                                  return "Incorrect password";
                                }else{
                                  return null;
                                }
                              },
                            obscurePassword: true,
                              )
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ));
                            },
                            child: const Text("Forgot your password?",
                                style: TextStyle(
                                    fontSize: vsBS,
                                     ))),
                      ],
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(

                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.95,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:MaterialStateProperty.all(vsPrimaryColor)
                                  ),
                                  onPressed: (){
                                    if(_formKey.currentState!.validate()){

                                    }
                                  }, child: const Text("Sign In",style: TextStyle(color: Colors.white),),
                              ),
                            ),



                            Row(
                              children: [
                                const Text("Don't have an account yet?",style: TextStyle(
                                  fontSize: vsBS
                                ),),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),));

                                }, child: const Text("SignUp",style: TextStyle(
                                    fontSize: vsBS,
                                    decoration: TextDecoration.underline
                                ))),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
