import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  // Reusable border style (gray, radius 16, width 2) per the spec
  OutlineInputBorder _fieldBorder({Color color = const Color(0xFF898F9C)}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Facebook logo
              Image.asset(
                'assets/images/facebook_rounded_logo.png',
                width: 100,
                height: 100,
              ),

              const SizedBox(height: 24),

              // Mobile Number or Email Address field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Mobile Number or Email Address',
                  hintStyle: const TextStyle(
                    color: Color(0xFF898F9C),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F6F8), // لون رمادي فاتح للمربعات كما في الصورة
                  contentPadding: const EdgeInsets.all(16),
                  border: _fieldBorder(),
                  enabledBorder: _fieldBorder(),
                  focusedBorder: _fieldBorder(color: const Color(0xFF1877F2)),
                ),
                cursorColor: const Color(0xFF1877F2),
              ),

              const SizedBox(height: 16),

              // Password field
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: Color(0xFF898F9C),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F6F8), // لون رمادي فاتح للمربعات كما في الصورة
                  contentPadding: const EdgeInsets.all(16),
                  border: _fieldBorder(),
                  enabledBorder: _fieldBorder(),
                  focusedBorder: _fieldBorder(color: const Color(0xFF1877F2)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: const Color(0xFF898F9C),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                cursorColor: const Color(0xFF1877F2),
              ),

              const SizedBox(height: 20),

              // Login button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1877F2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    overlayColor: Colors.transparent,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Forgotten Password link
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgotten Password ?',
                  style: TextStyle(color: Color(0xFF898F9C), fontSize: 14),
                ),
              ),

              const Spacer(),

              // Create Account button (outlined)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF1877F2),
                    padding: const EdgeInsets.all(16),
                    side: const BorderSide(color: Color(0xFF1877F2), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Meta branding at the very bottom
              Image.asset(
                'assets/images/meta_logo.png',
                width: 90,
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}