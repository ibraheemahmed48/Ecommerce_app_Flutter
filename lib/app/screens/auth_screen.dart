import 'package:ecommerce_app/app/services/auth_services.dart';
import 'package:ecommerce_app/app/widgets/custem_textF.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:ecommerce_app/components/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../widgets/custom_button.dart';

enum AuthEnum {
  signin,
  signup
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-Screen";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthEnum _auth = AuthEnum.signup;
  final _signUpKey = GlobalKey<FormState>();
  final _signInKey = GlobalKey<FormState>();
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _namelText = TextEditingController();
  final TextEditingController _passwordlText = TextEditingController();
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      print("AuthScreen name : ${Provider.of<UserProvider>(context,listen: false).user.name}");

    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailText.dispose();
    _namelText.dispose();
    _passwordlText.dispose();
  }
  void singUp(){
    print("**************************singUp");
    authService.singUpUser(
        email: _emailText.text,
        password: _passwordlText.text,
        name: _namelText.text,
        context: context);
  }
  void singIn(){
    print("**************************singIp");
    authService.singInUser(
        email: _emailText.text,
        password: _passwordlText.text,
        context: context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Declarations.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Welcome TO \n E-commerce App",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 50,
                ),

                //
                // ListTile(
                //   tileColor: _auth == AuthEnum.signup ?
                //   Declarations.backgroundColor:Declarations.greyBackgroundColor ,
                //   title: const Text("New Customer",style: TextStyle(fontWeight: FontWeight.bold),),
                //   leading: Radio(
                //       value: AuthEnum.signup,
                //       activeColor: Declarations.secondaryColor,
                //       groupValue:_auth,
                //       onChanged:(AuthEnum? val){
                //         setState(() {
                //           _auth = val ?? AuthEnum.signup;
                //         });
                //
                //       }
                //   ),
                //
                // ),
                if (_auth == AuthEnum.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Declarations.backgroundColor,
                    child: Form(
                      key: _signUpKey,
                      child: Column(
                        children: [
                          CustemText(
                            controller: _namelText,
                            hintText: 'Name',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustemText(
                            controller: _emailText,
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustemText(
                            controller: _passwordlText,
                            hintText: 'Password',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onTap: () {
                              print("**************************onTap");
                              if(_signUpKey.currentState!.validate()){
                                singUp();
                              }else{
                                print("**************************else");
                                showSnackBar(context, "Eroor");
                              }


                            },
                            text: 'Sign Up',
                          ),
                        ],
                      ),
                    ),
                  ),

                // ListTile(
                //   tileColor: _auth == AuthEnum.signin ?
                //   Declarations.backgroundColor:Declarations.greyBackgroundColor ,
                //   title: const Text("HAVE ACCOUNT",style: TextStyle(fontWeight: FontWeight.bold),),
                //   leading: Radio(
                //       value: AuthEnum.signin,
                //       activeColor: Declarations.secondaryColor,
                //       groupValue:_auth,
                //       onChanged:(AuthEnum? val){
                //         setState(() {
                //           _auth = val ?? AuthEnum.signin;
                //         });
                //
                //       }
                //   ),
                //
                // ),
                if (_auth == AuthEnum.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Declarations.backgroundColor,
                    child: Form(
                      key: _signInKey,
                      child: Column(
                        children: [
                          CustemText(
                            controller: _emailText,
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustemText(
                            controller: _passwordlText,
                            hintText: 'Password',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            onTap: () {
                              print("**************************onTap");
                              if(_signInKey.currentState!.validate()){
                                singIn();
                              }


                            },
                            text: 'Sign In',
                          ),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _auth == AuthEnum.signup
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account ?"),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _auth = AuthEnum.signin;
                      });
                    },
                    child: const Text("Sign In"))
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account ?"),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _auth = AuthEnum.signup;
                      });
                    },
                    child: const Text("Sign up"))
              ],
            ),
    );
  }
}
