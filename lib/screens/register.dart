import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isArabic = false;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  int _selectedAvatar = 1;

 final List<String> _avatarImages = [
  Appassets.avatar_8,//
  Appassets.avatar_1,
  Appassets.avatar_2,
];

  final List<IconData> _avatarIcons = [
    Icons.headset_mic,
    Icons.person,
    Icons.face,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.amber, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), 
                ],
              ),

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
  radius: isSelected ? 42 : 32,
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
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),

              const SizedBox(height: 20),

              
              _buildField("Name", Icons.badge_outlined),
              const SizedBox(height: 12),

              
              _buildField("Email", Icons.email_outlined, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 12),

              
              _buildPasswordField(
                hint: "Password",
                obscure: _obscurePassword,
                onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
              const SizedBox(height: 12),

              
              _buildPasswordField(
                hint: "Confirm Password",
                obscure: _obscureConfirm,
                onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
              ),
              const SizedBox(height: 12),

              
              _buildField("Phone Number", Icons.phone_outlined, keyboardType: TextInputType.phone),
              const SizedBox(height: 24),

              
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
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
                    onTap: () => Navigator.pop(context),
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
      ),
    );
  }

  Widget _buildField(String hint, IconData icon, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      keyboardType: keyboardType,
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

  Widget _buildPasswordField({
    required String hint,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.white,
          ),
          onPressed: onToggle,
        ),
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