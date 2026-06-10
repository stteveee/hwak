import 'package:flutter/material.dart';

void main() {
  runApp(const HwakApp());
}

class HwakApp extends StatelessWidget {
  const HwakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HWAK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF6B2B)),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ══════════════════════════════════════════
// WELCOME SCREEN
// ══════════════════════════════════════════
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 100, height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B2B),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.flutter_dash, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 14),
              const Text('HWAK', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF0A0A0A), letterSpacing: 3)),
              const SizedBox(height: 4),
              const Text('FREELANCE MARKETPLACE', style: TextStyle(fontSize: 10, color: Color(0xFFFF6B2B), letterSpacing: 3)),
              const Spacer(flex: 2),
              const Text('Welcome to Hwak', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
              const Spacer(flex: 2),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RoleSelectionScreen())),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 0,
                      ),
                      child: const Text('Sign up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFFF6B2B),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        side: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5),
                      ),
                      child: const Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Row(children: [
                Expanded(child: Divider()),
                Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('or continue with', style: TextStyle(color: Colors.grey, fontSize: 13))),
                Expanded(child: Divider()),
              ]),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialBtn('G', Colors.red), const SizedBox(width: 12),
                  _socialBtn('A', Colors.black), const SizedBox(width: 12),
                  _socialBtn('f', const Color(0xFF1877F2)), const SizedBox(width: 12),
                  _socialBtn('X', Colors.black),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialBtn(String label, Color color) {
    return Container(
      width: 56, height: 56,
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Center(child: Text(label, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color))),
    );
  }
}

// ══════════════════════════════════════════
// ROLE SELECTION SCREEN
// ══════════════════════════════════════════
class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Logo
              Container(
                width: 90, height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B2B),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(Icons.flutter_dash, size: 54, color: Colors.white),
              ),
              const SizedBox(height: 12),
              const Text('HWAK', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Color(0xFF0A0A0A), letterSpacing: 3)),
              const Spacer(flex: 2),
              const Text(
                'How do you want\nto use Hwak?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A), height: 1.3),
              ),
              const SizedBox(height: 10),
              const Text('Choose your role to continue.', style: TextStyle(fontSize: 14, color: Colors.grey)),
              const Spacer(flex: 2),
              // Client Card
              _roleCard(
                label: 'I am a Client',
                icon: Icons.work_outline,
                value: 'client',
              ),
              const SizedBox(height: 14),
              // Freelancer Card
              _roleCard(
                label: 'I am a Freelancer',
                icon: Icons.laptop_mac_outlined,
                value: 'freelancer',
              ),
              const Spacer(flex: 2),
              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedRole == null ? null : () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) => SignupScreen(role: _selectedRole!),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B2B),
                    disabledBackgroundColor: const Color(0xFFFFBFA0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                  ),
                  child: const Text('Continue', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                child: RichText(
                  text: const TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    children: [TextSpan(text: 'Login', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w700))],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleCard({required String label, required IconData icon, required String value}) {
    final bool selected = _selectedRole == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedRole = value),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFF6B2B).withOpacity(0.06) : Colors.white,
          border: Border.all(
            color: selected ? const Color(0xFFFF6B2B) : const Color(0xFFE0E0E0),
            width: selected ? 2 : 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 46, height: 46,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFFF6B2B).withOpacity(0.15) : const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: selected ? const Color(0xFFFF6B2B) : Colors.grey, size: 26),
            ),
            const SizedBox(width: 16),
            Text(label, style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600,
              color: selected ? const Color(0xFF0A0A0A) : Colors.grey.shade700,
            )),
            const Spacer(),
            if (selected) const Icon(Icons.check_circle, color: Color(0xFFFF6B2B), size: 22),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════
// SIGNUP SCREEN
// ══════════════════════════════════════════
class SignupScreen extends StatefulWidget {
  final String role;
  const SignupScreen({super.key, required this.role});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscure = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0A0A0A)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                widget.role == 'client' ? 'Create Client Account' : 'Create Freelancer Account',
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A)),
              ),
              const SizedBox(height: 8),
              Text(
                widget.role == 'client' ? 'Post tasks & hire top freelancers' : 'Showcase skills & earn money',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              _buildField('Full Name', 'Enter your full name', Icons.person_outline),
              const SizedBox(height: 18),
              _buildField('Email', 'Enter your email', Icons.email_outlined, type: TextInputType.emailAddress),
              const SizedBox(height: 18),
              _buildField('Phone Number', '03XX-XXXXXXX', Icons.phone_outlined, type: TextInputType.phone),
              const SizedBox(height: 18),
              _buildPasswordField('Password', 'Create a password', _obscure, () => setState(() => _obscure = !_obscure)),
              const SizedBox(height: 18),
              _buildPasswordField('Confirm Password', 'Confirm your password', _obscureConfirm, () => setState(() => _obscureConfirm = !_obscureConfirm)),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                  ),
                  child: const Text('Create Account', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ', style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                    child: const Text('Login', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint, IconData icon, {TextInputType type = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
        const SizedBox(height: 8),
        TextField(
          keyboardType: type,
          decoration: InputDecoration(
            hintText: hint, hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(icon, color: const Color(0xFFFF6B2B)),
            filled: true, fillColor: const Color(0xFFF8F8F8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, String hint, bool obscure, VoidCallback toggle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint, hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFFF6B2B)),
            suffixIcon: IconButton(
              icon: Icon(obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey),
              onPressed: toggle,
            ),
            filled: true, fillColor: const Color(0xFFF8F8F8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
          ),
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════
// LOGIN SCREEN
// ══════════════════════════════════════════
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0A0A0A)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text('Welcome Back 👋', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
              const SizedBox(height: 8),
              const Text('Login to your HWAK account', style: TextStyle(fontSize: 15, color: Colors.grey)),
              const SizedBox(height: 36),
              const Text('Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email', hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFFFF6B2B)),
                  filled: true, fillColor: const Color(0xFFF8F8F8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
              const SizedBox(height: 8),
              TextField(
                obscureText: _obscure,
                decoration: InputDecoration(
                  hintText: 'Enter your password', hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFFF6B2B)),
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                  filled: true, fillColor: const Color(0xFFF8F8F8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 28),
              const Row(children: [
                Expanded(child: Divider()),
                Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('or continue with', style: TextStyle(color: Colors.grey, fontSize: 13))),
                Expanded(child: Divider()),
              ]),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialBtn('G', Colors.red), const SizedBox(width: 12),
                  _socialBtn('A', Colors.black), const SizedBox(width: 12),
                  _socialBtn('f', const Color(0xFF1877F2)), const SizedBox(width: 12),
                  _socialBtn('X', Colors.black),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ", style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const RoleSelectionScreen())),
                    child: const Text('Sign up', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialBtn(String label, Color color) {
    return Container(
      width: 56, height: 56,
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Center(child: Text(label, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color))),
    );
  }
}