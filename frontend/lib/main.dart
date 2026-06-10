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
              Container(
                width: 90, height: 90,
                decoration: BoxDecoration(color: const Color(0xFFFF6B2B), borderRadius: BorderRadius.circular(22)),
                child: const Icon(Icons.flutter_dash, size: 54, color: Colors.white),
              ),
              const SizedBox(height: 12),
              const Text('HWAK', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Color(0xFF0A0A0A), letterSpacing: 3)),
              const Spacer(flex: 2),
              const Text('How do you want\nto use Hwak?', textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A), height: 1.3)),
              const SizedBox(height: 10),
              const Text('Choose your role to continue.', style: TextStyle(fontSize: 14, color: Colors.grey)),
              const Spacer(flex: 2),
              _roleCard(label: 'I am a Client', icon: Icons.work_outline, value: 'client'),
              const SizedBox(height: 14),
              _roleCard(label: 'I am a Freelancer', icon: Icons.laptop_mac_outlined, value: 'freelancer'),
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedRole == null ? null : () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen(role: _selectedRole!))),
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
                child: RichText(text: const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  children: [TextSpan(text: 'Login', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w700))],
                )),
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
          border: Border.all(color: selected ? const Color(0xFFFF6B2B) : const Color(0xFFE0E0E0), width: selected ? 2 : 1.5),
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
            Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: selected ? const Color(0xFF0A0A0A) : Colors.grey.shade700)),
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
  final TextEditingController _emailController = TextEditingController();

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
              _buildFieldWithController('Email', 'Enter your email', Icons.email_outlined, _emailController, type: TextInputType.emailAddress),
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
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (_) => OtpScreen(
                      email: _emailController.text.isEmpty ? 'your@email.com' : _emailController.text,
                      role: widget.role,
                    ),
                  )),
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

  Widget _buildFieldWithController(String label, String hint, IconData icon, TextEditingController controller, {TextInputType type = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
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
// OTP SCREEN
// ══════════════════════════════════════════
class OtpScreen extends StatefulWidget {
  final String email;
  final String role;
  const OtpScreen({super.key, required this.email, required this.role});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 80, height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B2B).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.mark_email_unread_outlined, color: Color(0xFFFF6B2B), size: 40),
              ),
              const SizedBox(height: 24),
              const Text('Verify Your Email', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
              const SizedBox(height: 10),
              Text(
                'We sent a 6-digit code to\n${widget.email}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (i) => SizedBox(
                  width: 48, height: 56,
                  child: TextField(
                    controller: _controllers[i],
                    focusNode: _focusNodes[i],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true, fillColor: const Color(0xFFF8F8F8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 2),
                      ),
                    ),
                    onChanged: (val) {
                      if (val.isNotEmpty && i < 5) _focusNodes[i + 1].requestFocus();
                      else if (val.isEmpty && i > 0) _focusNodes[i - 1].requestFocus();
                    },
                  ),
                )),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => ClientHomeScreen(role: widget.role)),
                    (route) => false,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                  ),
                  child: const Text('Verify', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive code? ", style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('Resend', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const ClientHomeScreen(role: 'client')),
                    (route) => false,
                  ),
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

// ══════════════════════════════════════════
// CLIENT HOME SCREEN
// ══════════════════════════════════════════
class ClientHomeScreen extends StatefulWidget {
  final String role;
  const ClientHomeScreen({super.key, required this.role});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.computer, 'label': 'Tech'},
    {'icon': Icons.brush, 'label': 'Design'},
    {'icon': Icons.video_camera_back, 'label': 'Video'},
    {'icon': Icons.campaign, 'label': 'Marketing'},
    {'icon': Icons.smart_toy, 'label': 'AI'},
    {'icon': Icons.school, 'label': 'Tuition'},
    {'icon': Icons.home_repair_service, 'label': 'Home'},
    {'icon': Icons.business_center, 'label': 'Business'},
  ];

  final List<Map<String, dynamic>> _topFreelancers = [
    {'name': 'Ayesha Khan', 'skill': 'Graphic Designer', 'rating': 4.9, 'level': 'Level 2', 'verified': true},
    {'name': 'Bilal Ahmed', 'skill': 'Video Editor', 'rating': 4.8, 'level': 'Level 1', 'verified': false},
    {'name': 'Sara Malik', 'skill': 'Content Writer', 'rating': 5.0, 'level': 'Level 3', 'verified': true},
  ];

  Widget _homeTab() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Row(
              children: [
                Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(color: const Color(0xFFFF6B2B), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.flutter_dash, color: Colors.white, size: 26),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome back 👋', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('Find your freelancer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
                    ],
                  ),
                ),
                Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
                  ),
                  child: const Icon(Icons.notifications_none, color: Color(0xFF0A0A0A)),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a service...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Color(0xFFFF6B2B)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF6B2B), Color(0xFFFF8C55)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Need something done?', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Post a task & get bids in minutes', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, foregroundColor: const Color(0xFFFF6B2B),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    ),
                    child: const Text('Post Task', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
            child: Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 14, crossAxisSpacing: 12, childAspectRatio: 0.85,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final cat = _categories[index];
                return Column(
                  children: [
                    Container(
                      width: 56, height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B2B).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(cat['icon'], color: const Color(0xFFFF6B2B), size: 26),
                    ),
                    const SizedBox(height: 6),
                    Text(cat['label'], style: const TextStyle(fontSize: 11, color: Color(0xFF0A0A0A), fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                  ],
                );
              },
              childCount: _categories.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top Freelancers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
                Text('See all', style: TextStyle(fontSize: 13, color: Color(0xFFFF6B2B), fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final f = _topFreelancers[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: const Color(0xFFFF6B2B).withOpacity(0.1),
                        child: Text(f['name'][0], style: const TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(f['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0A0A0A))),
                                if (f['verified']) ...[
                                  const SizedBox(width: 4),
                                  const Icon(Icons.verified, color: Color(0xFFFF6B2B), size: 14),
                                ],
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(f['skill'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Color(0xFFFFC107), size: 14),
                                const SizedBox(width: 4),
                                Text('${f['rating']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: const Color(0xFFF0F0F0), borderRadius: BorderRadius.circular(8)),
                                  child: Text(f['level'], style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFFF6B2B)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('Hire', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                );
              },
              childCount: _topFreelancers.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 90)),
      ],
    );
  }

  Widget _myTasksTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80, height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B2B).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.list_alt_outlined, color: Color(0xFFFF6B2B), size: 40),
          ),
          const SizedBox(height: 16),
          const Text('No Tasks Yet', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
          const SizedBox(height: 8),
          const Text('Post a task to get started', style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: const Text('Post a Task', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _messagesTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80, height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B2B).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.chat_bubble_outline, color: Color(0xFFFF6B2B), size: 40),
          ),
          const SizedBox(height: 16),
          const Text('No Messages Yet', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
          const SizedBox(height: 8),
          const Text('Your conversations will appear here', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _profileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: const Color(0xFFFF6B2B).withOpacity(0.1),
            child: const Icon(Icons.person, color: Color(0xFFFF6B2B), size: 50),
          ),
          const SizedBox(height: 14),
          const Text('Your Name', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
          const SizedBox(height: 4),
          const Text('your@email.com', style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B2B).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              widget.role == 'client' ? 'Client' : 'Freelancer',
              style: const TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ),
          const SizedBox(height: 28),
          _profileTile(Icons.person_outline, 'Edit Profile'),
          _profileTile(Icons.lock_outline, 'Change Password'),
          _profileTile(Icons.notifications_none, 'Notifications'),
          _profileTile(Icons.help_outline, 'Help & Support'),
          _profileTile(Icons.info_outline, 'About HWAK'),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                (route) => false,
              ),
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileTile(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6)],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFFF6B2B)),
        title: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _homeTab(),
            _myTasksTab(),
            _messagesTab(),
            _profileTab(),
          ],
        ),
      ),
      floatingActionButton: _selectedIndex == 0 ? FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFF6B2B),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF6B2B),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), activeIcon: Icon(Icons.list_alt), label: 'My Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), activeIcon: Icon(Icons.chat_bubble), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}