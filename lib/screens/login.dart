
import 'package:flutter/material.dart';
import 'package:movie_app/screens/register.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isArabic = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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

             
              _buildTextField("Email", Icons.email_outlined),
              const SizedBox(height: 16),

             
              TextField(
                obscureText: _obscurePassword,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF1C1C1E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              
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
                  onPressed: () {},
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
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: const Color(0xFF1C1C1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}