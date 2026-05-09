import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';
import 'package:movie_app/utiles/dialog_utils.dart';
import 'package:movie_app/widgets/builtTextField.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isArabic = false;
  bool isObscure = true;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  bool _obscureConfirm = true;
  int _selectedAvatar = 1;

 final List<String> _avatarImages = [
  Appassets.avatar_8,//
  Appassets.avatar_1,
  Appassets.avatar_2,
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Appcolors.blackColor,
              centerTitle: true,
              leading: Icon(Icons.arrow_back,color: Appcolors.yellowColor,),
              title: Text('Register',style: TextStyle(
                color: Appcolors.yellowColor,fontSize:16
              ),),),
      backgroundColor:  Appcolors.blackColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const SizedBox(height: 20),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final isSelected = _selectedAvatar == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedAvatar = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(
                      horizontal: isSelected ? 8 : 4,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
        radius: isSelected ? 60 : 50,
        backgroundImage: AssetImage(_avatarImages[index]),
        backgroundColor: Colors.transparent,
      ),
                        if (isSelected)
                          Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.check, color: Colors.black, size: 11),
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 8),
            const Text(
              "Avatar",
              style: TextStyle(color: Appcolors.whiteColor, fontSize: 16),
            ),

            const SizedBox(height: 20),

        Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField('Name',Appassets.name_icon,nameController,
                  'Enter your Name',false,false,null),
              const SizedBox(height: 12),


              buildTextField('Email',Appassets.mail_icon,emailController,
                  'Enter your Email',true,false,null),
              const SizedBox(height: 12),


              buildTextField('Password',Appassets.pass_icon,passwordController,
                  'Enter your Password',false,isObscure,(){
                setState(() {
                  isObscure = !isObscure;
                });
                  }),
              const SizedBox(height: 12),


              buildTextField('Confirm Password',Appassets.pass_icon,confirmController,
                  'Enter your Password',false,isObscure,(){
                setState(() {
                  isObscure = !isObscure;
                });
                  }),
              const SizedBox(height: 12),


              buildTextField('Phone Number',Appassets.phone_icon,phoneController,
                  'Enter your Number',false,false,null),
              const SizedBox(height: 24),
            ],
          ),
        ),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    return register();
                  }
                },
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 16),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already Have Account ? ",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('login'),
                  child: const Text(
                    "Login",
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
    );
  }
  void register()async{
    if(_formKey.currentState?.validate() == true){
      //todo : register
      //todo : show loading
      DialogUtils.showloading(context: context);
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        //todo : hide loading
          DialogUtils.hideloading(context: context);
        //todo : show message
        DialogUtils.showMessage(context: context, message: 'Register Successfully',
        posActionName: 'OK',posAction:(){
          Navigator.of(context).pushNamed('home');
            } );

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          //todo : hide loading
          DialogUtils.hideloading(context: context);
          //todo : show message
          DialogUtils.showMessage(context: context,
              message: 'The password provided is too weak.',
              posActionName: 'OK',
          );
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          //todo : hide loading
          DialogUtils.hideloading(context: context);
          //todo : show message
          DialogUtils.showMessage(context: context,
            message: 'The account already exists for that email.',
            posActionName: 'OK',
          );
        }
      } catch (e) {
        //todo : hide loading
        DialogUtils.hideloading(context: context);
        //todo : show message
        DialogUtils.showMessage(context: context,
          message: e.toString(),
          posActionName: 'OK',
        );
      }
    }
  }
}