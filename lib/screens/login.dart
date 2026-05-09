
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/register.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/dialog_utils.dart';
import 'package:movie_app/widgets/builtTextField.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isArabic = false;
  bool isObscure = true;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),


                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.amber, width: 3),
                  ),
                  child: const Center(
                    child: Icon(Icons.play_arrow_rounded, color: Colors.amber, size: 60),
                  ),
                ),
                const SizedBox(height: 40),

                buildTextField('Email',Appassets.mail_icon,emailController,
                    'Enter your Email',true,false,null),
                const SizedBox(height: 16),


                buildTextField('Password',Appassets.pass_icon,passwordController,
                    'Enter your Password',false,isObscure,(){
                  setState(() {
                    isObscure = !isObscure;
                  });
                    }),


                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password ?",
                      style: TextStyle(color: Colors.amber, fontSize: 13),
                    ),
                  ),
                ),

                const SizedBox(height: 10),


                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        return login();
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 16),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have Account ? ",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        "Create One",
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),


                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.amber, thickness: 0.8)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OR", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(child: Divider(color: Colors.amber, thickness: 0.8)),
                  ],
                ),

                const SizedBox(height: 16),


                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Text("G", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 18)),
                    label: const Text(
                      "Login With Google",
                      style: TextStyle(color: Colors.amber, fontSize: 16),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.amber),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),

                const SizedBox(height: 30),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("🇺🇸", style: TextStyle(fontSize: 22)),
                    Switch(
                      value: isArabic,
                      activeColor: Colors.amber,
                      inactiveThumbColor: Colors.grey,
                      onChanged: (val) => setState(() => isArabic = val),
                    ),
                    const Text("🇪🇬", style: TextStyle(fontSize: 22)),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void login()async{
    if(_formKey.currentState?.validate() == true){
      //todo : login
      //todo : show loading
      DialogUtils.showloading(context: context);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      //todo : hide loading
      DialogUtils.hideloading(context: context);
      //todo : show message
      DialogUtils.showMessage(context: context, message: 'Login Successfully',
      posActionName: 'Ok',posAction: (){
        Navigator.of(context).pushNamed('home');
          });
    } on FirebaseAuthException catch (e) {
      //todo : hide loading
      DialogUtils.hideloading(context: context);
      //todo : show message
      DialogUtils.showMessage(context: context,
          message: 'user-not-found');
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    }
  }
}

