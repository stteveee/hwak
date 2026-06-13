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
// ROLE SELECTION
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
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0A0A0A)), onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 8),
            Text(widget.role == 'client' ? 'Create Client Account' : 'Create Freelancer Account',
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
            const SizedBox(height: 8),
            Text(widget.role == 'client' ? 'Post tasks & hire top freelancers' : 'Showcase skills & earn money',
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
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
            SizedBox(width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OtpScreen(
                  email: _emailController.text.isEmpty ? 'your@email.com' : _emailController.text,
                  role: widget.role,
                ))),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), elevation: 0),
                child: const Text('Create Account', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Already have an account? ', style: TextStyle(color: Colors.grey)),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                child: const Text('Login', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w700)),
              ),
            ]),
            const SizedBox(height: 24),
          ]),
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint, IconData icon, {TextInputType type = TextInputType.text}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
      const SizedBox(height: 8),
      TextField(keyboardType: type, decoration: InputDecoration(
        hintText: hint, hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: const Color(0xFFFF6B2B)),
        filled: true, fillColor: const Color(0xFFF8F8F8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
      )),
    ]);
  }

  Widget _buildFieldWithController(String label, String hint, IconData icon, TextEditingController controller, {TextInputType type = TextInputType.text}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
      const SizedBox(height: 8),
      TextField(controller: controller, keyboardType: type, decoration: InputDecoration(
        hintText: hint, hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: const Color(0xFFFF6B2B)),
        filled: true, fillColor: const Color(0xFFF8F8F8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
      )),
    ]);
  }

  Widget _buildPasswordField(String label, String hint, bool obscure, VoidCallback toggle) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
      const SizedBox(height: 8),
      TextField(obscureText: obscure, decoration: InputDecoration(
        hintText: hint, hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFFF6B2B)),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey),
          onPressed: toggle,
        ),
        filled: true, fillColor: const Color(0xFFF8F8F8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
      )),
    ]);
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
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0A0A0A)), onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 20),
            Container(
              width: 80, height: 80,
              decoration: BoxDecoration(color: const Color(0xFFFF6B2B).withOpacity(0.1), shape: BoxShape.circle),
              child: const Icon(Icons.mark_email_unread_outlined, color: Color(0xFFFF6B2B), size: 40),
            ),
            const SizedBox(height: 24),
            const Text('Verify Your Email', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
            const SizedBox(height: 10),
            Text('We sent a 6-digit code to\n${widget.email}', textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.grey, height: 1.5)),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (i) => SizedBox(
                width: 48, height: 56,
                child: TextField(
                  controller: _controllers[i], focusNode: _focusNodes[i],
                  textAlign: TextAlign.center, keyboardType: TextInputType.number, maxLength: 1,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    counterText: '', filled: true, fillColor: const Color(0xFFF8F8F8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 2)),
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
                  MaterialPageRoute(builder: (_) => widget.role == 'freelancer'
    ? const FreelancerHomeScreen()
    : ClientHomeScreen(role: widget.role)),
                  (route) => false,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), elevation: 0,
                ),
                child: const Text('Verify', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(height: 24),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Didn't receive code? ", style: TextStyle(color: Colors.grey)),
              GestureDetector(onTap: () {}, child: const Text('Resend', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w700))),
            ]),
          ]),
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
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0A0A0A)), onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 16),
            const Text('Welcome Back 👋', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
            const SizedBox(height: 8),
            const Text('Login to your HWAK account', style: TextStyle(fontSize: 15, color: Colors.grey)),
            const SizedBox(height: 36),
            const Text('Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
            const SizedBox(height: 8),
            TextField(keyboardType: TextInputType.emailAddress, decoration: InputDecoration(
              hintText: 'Enter your email', hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFFFF6B2B)),
              filled: true, fillColor: const Color(0xFFF8F8F8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
            )),
            const SizedBox(height: 20),
            const Text('Password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
            const SizedBox(height: 8),
            TextField(obscureText: _obscure, decoration: InputDecoration(
              hintText: 'Enter your password', hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFFF6B2B)),
              suffixIcon: IconButton(
                icon: Icon(_obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
              filled: true, fillColor: const Color(0xFFF8F8F8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
            )),
            const SizedBox(height: 12),
            Align(alignment: Alignment.centerRight,
              child: TextButton(onPressed: () {}, child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 24),
            SizedBox(width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (_) => const ClientHomeScreen(role: 'client')), (route) => false),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), elevation: 0),
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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _socialBtn('G', Colors.red), const SizedBox(width: 12),
              _socialBtn('A', Colors.black), const SizedBox(width: 12),
              _socialBtn('f', const Color(0xFF1877F2)), const SizedBox(width: 12),
              _socialBtn('X', Colors.black),
            ]),
            const SizedBox(height: 28),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have an account? ", style: TextStyle(color: Colors.grey)),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const RoleSelectionScreen())),
                child: const Text('Sign up', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w700)),
              ),
            ]),
            const SizedBox(height: 24),
          ]),
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
// POST TASK SCREEN
// ══════════════════════════════════════════
class PostTaskScreen extends StatefulWidget {
  const PostTaskScreen({super.key});
  @override
  State<PostTaskScreen> createState() => _PostTaskScreenState();
}

class _PostTaskScreenState extends State<PostTaskScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _budgetController = TextEditingController();
  String? _selectedCategory;
  DateTime? _selectedDeadline;

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

  Future<void> _pickDeadline() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 3)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(colorScheme: const ColorScheme.light(primary: Color(0xFFFF6B2B))),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedDeadline = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0A0A0A)), onPressed: () => Navigator.pop(context)),
        title: const Text('Post a Task', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 8),
            _sectionLabel('Task Title'),
            const SizedBox(height: 8),
            TextField(controller: _titleController, decoration: _inputDeco('e.g. Design a logo for my brand', Icons.title)),
            const SizedBox(height: 20),
            _sectionLabel('Category'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10, runSpacing: 10,
              children: _categories.map((cat) {
                final bool selected = _selectedCategory == cat['label'];
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = cat['label']),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: selected ? const Color(0xFFFF6B2B) : const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: selected ? const Color(0xFFFF6B2B) : const Color(0xFFE0E0E0)),
                    ),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(cat['icon'], size: 16, color: selected ? Colors.white : const Color(0xFFFF6B2B)),
                      const SizedBox(width: 6),
                      Text(cat['label'], style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: selected ? Colors.white : const Color(0xFF0A0A0A))),
                    ]),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            _sectionLabel('Description'),
            const SizedBox(height: 8),
            TextField(
              controller: _descController, maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Describe your task in detail...',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true, fillColor: const Color(0xFFF8F8F8),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 20),
            _sectionLabel('Budget (PKR)'),
            const SizedBox(height: 8),
            TextField(controller: _budgetController, keyboardType: TextInputType.number, decoration: _inputDeco('e.g. 5000', Icons.payments_outlined)),
            const SizedBox(height: 20),
            _sectionLabel('Deadline'),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickDeadline,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(color: const Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(14)),
                child: Row(children: [
                  const Icon(Icons.calendar_today_outlined, color: Color(0xFFFF6B2B), size: 20),
                  const SizedBox(width: 12),
                  Text(
                    _selectedDeadline == null ? 'Select a deadline' : '${_selectedDeadline!.day}/${_selectedDeadline!.month}/${_selectedDeadline!.year}',
                    style: TextStyle(fontSize: 14, color: _selectedDeadline == null ? Colors.grey : const Color(0xFF0A0A0A)),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                ]),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Task posted successfully! 🎉'), backgroundColor: Color(0xFFFF6B2B)),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), elevation: 0,
                ),
                child: const Text('Post Task', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(height: 32),
          ]),
        ),
      ),
    );
  }

  Widget _sectionLabel(String label) => Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0A0A0A)));

  InputDecoration _inputDeco(String hint, IconData icon) => InputDecoration(
    hintText: hint, hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    prefixIcon: Icon(icon, color: const Color(0xFFFF6B2B)),
    filled: true, fillColor: const Color(0xFFF8F8F8),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
  );
}

// ══════════════════════════════════════════
// FREELANCER DETAIL SCREEN
// ══════════════════════════════════════════
class FreelancerDetailScreen extends StatelessWidget {
  final Map<String, dynamic> freelancer;
  const FreelancerDetailScreen({super.key, required this.freelancer});

  @override
  Widget build(BuildContext context) {
    final List<String> skills = freelancer['skills'] as List<String>;
    final List<String> portfolio = freelancer['portfolio'] as List<String>;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(24, 56, 24, 24),
              child: Column(children: [
                Row(children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0A0A0A)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  IconButton(icon: const Icon(Icons.bookmark_border, color: Color(0xFF0A0A0A)), onPressed: () {}),
                ]),
                const SizedBox(height: 8),
                CircleAvatar(
                  radius: 44,
                  backgroundColor: const Color(0xFFFF6B2B).withOpacity(0.1),
                  child: Text(freelancer['name'][0], style: const TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.bold, fontSize: 32)),
                ),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(freelancer['name'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
                  if (freelancer['verified']) ...[
                    const SizedBox(width: 6),
                    const Icon(Icons.verified, color: Color(0xFFFF6B2B), size: 20),
                  ],
                ]),
                const SizedBox(height: 4),
                Text(freelancer['skill'], style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  _statChip(Icons.star, '${freelancer['rating']}', const Color(0xFFFFC107)),
                  const SizedBox(width: 12),
                  _statChip(Icons.work_outline, freelancer['level'], const Color(0xFFFF6B2B)),
                  const SizedBox(width: 12),
                  _statChip(Icons.check_circle_outline, '${freelancer['jobs']} jobs', Colors.green),
                ]),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
                const SizedBox(height: 8),
                Text(freelancer['about'], style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.6)),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Skills', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8, runSpacing: 8,
                  children: skills.map((s) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B2B).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(s, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFFFF6B2B))),
                  )).toList(),
                ),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Portfolio', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
                const SizedBox(height: 12),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: portfolio.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (_, i) => Container(
                      width: 100, height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B2B).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text(portfolio[i], style: const TextStyle(fontSize: 11, color: Color(0xFFFF6B2B), fontWeight: FontWeight.w600), textAlign: TextAlign.center)),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, -3))],
        ),
        child: Row(children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(name: freelancer['name'] as String))),
              icon: const Icon(Icons.chat_bubble_outline, size: 18),
              label: const Text('Message'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFFF6B2B),
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Color(0xFFFF6B2B)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Offer sent! 🎉'), backgroundColor: Color(0xFFFF6B2B)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), elevation: 0,
              ),
              child: const Text('Send Offer', style: TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _statChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
      ]),
    );
  }
}

// ══════════════════════════════════════════
// CHAT SCREEN
// ══════════════════════════════════════════
class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _msgController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hi! I saw your task posting, I am interested.', 'isMe': false, 'time': '10:30 AM'},
    {'text': 'Great! Can you share some of your previous work?', 'isMe': true, 'time': '10:32 AM'},
    {'text': 'Sure, I can start tomorrow!', 'isMe': false, 'time': '10:35 AM'},
  ];

  void _sendMessage() {
    if (_msgController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({'text': _msgController.text.trim(), 'isMe': true, 'time': 'Now'});
      _msgController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0A0A0A)), onPressed: () => Navigator.pop(context)),
        title: Row(children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: const Color(0xFFFF6B2B).withOpacity(0.1),
            child: Text(widget.name[0], style: const TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 10),
          Text(widget.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
        ]),
        actions: [
          IconButton(icon: const Icon(Icons.call_outlined, color: Color(0xFFFF6B2B)), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final bool isMe = msg['isMe'] as bool;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    decoration: BoxDecoration(
                      color: isMe ? const Color(0xFFFF6B2B) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(isMe ? 16 : 4),
                        bottomRight: Radius.circular(isMe ? 4 : 16),
                      ),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)],
                    ),
                    child: Column(
                      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(msg['text'] as String, style: TextStyle(fontSize: 14, color: isMe ? Colors.white : const Color(0xFF0A0A0A))),
                        const SizedBox(height: 4),
                        Text(msg['time'] as String, style: TextStyle(fontSize: 10, color: isMe ? Colors.white70 : Colors.grey)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, -2))],
            ),
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: _msgController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                    filled: true, fillColor: const Color(0xFFF8F8F8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: const BoxDecoration(color: Color(0xFFFF6B2B), shape: BoxShape.circle),
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white, size: 20),
                  onPressed: _sendMessage,
                ),
              ),
            ]),
          ),
        ],
      ),
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
    {
      'name': 'Ayesha Khan', 'skill': 'Graphic Designer', 'rating': 4.9,
      'level': 'Level 2', 'verified': true, 'jobs': 47,
      'about': 'I am a professional graphic designer with 4+ years of experience in branding, logo design, and social media creatives. I deliver high quality work on time.',
      'skills': ['Logo Design', 'Branding', 'Illustrator', 'Photoshop', 'Canva'],
      'portfolio': ['Brand Identity', 'Logo Pack', 'Social Kit', 'Poster Design'],
    },
    {
      'name': 'Bilal Ahmed', 'skill': 'Video Editor', 'rating': 4.8,
      'level': 'Level 1', 'verified': false, 'jobs': 23,
      'about': 'Video editor specializing in YouTube, reels, and promotional videos. I use Premiere Pro and After Effects to create engaging content.',
      'skills': ['Premiere Pro', 'After Effects', 'Color Grading', 'Motion Graphics'],
      'portfolio': ['YouTube Video', 'Reel Edit', 'Promo Video'],
    },
    {
      'name': 'Sara Malik', 'skill': 'Content Writer', 'rating': 5.0,
      'level': 'Level 3', 'verified': true, 'jobs': 89,
      'about': 'Top-rated content writer with expertise in SEO articles, blog posts, product descriptions, and social media copy. Fluent in English and Urdu.',
      'skills': ['SEO Writing', 'Blog Posts', 'Copywriting', 'Social Media', 'Urdu Content'],
      'portfolio': ['SEO Article', 'Product Desc', 'Blog Post', 'Ad Copy'],
    },
  ];

  Widget _homeTab() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Row(children: [
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(color: const Color(0xFFFF6B2B), borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.flutter_dash, color: Colors.white, size: 26),
              ),
              const SizedBox(width: 12),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Welcome back 👋', style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text('Find your freelancer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
              ])),
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
                ),
                child: const Icon(Icons.notifications_none, color: Color(0xFF0A0A0A)),
              ),
            ]),
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
                gradient: const LinearGradient(colors: [Color(0xFFFF6B2B), Color(0xFFFF8C55)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(children: [
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Need something done?', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Post a task & get bids in minutes', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ])),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PostTaskScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, foregroundColor: const Color(0xFFFF6B2B),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  ),
                  child: const Text('Post Task', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
              ]),
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
                return Column(children: [
                  Container(
                    width: 56, height: 56,
                    decoration: BoxDecoration(color: const Color(0xFFFF6B2B).withOpacity(0.08), borderRadius: BorderRadius.circular(16)),
                    child: Icon(cat['icon'], color: const Color(0xFFFF6B2B), size: 26),
                  ),
                  const SizedBox(height: 6),
                  Text(cat['label'], style: const TextStyle(fontSize: 11, color: Color(0xFF0A0A0A), fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                ]);
              },
              childCount: _categories.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Top Freelancers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
              Text('See all', style: TextStyle(fontSize: 13, color: Color(0xFFFF6B2B), fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final f = _topFreelancers[index];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FreelancerDetailScreen(freelancer: f))),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
                    ),
                    child: Row(children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: const Color(0xFFFF6B2B).withOpacity(0.1),
                        child: Text(f['name'][0], style: const TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Text(f['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0A0A0A))),
                          if (f['verified']) ...[
                            const SizedBox(width: 4),
                            const Icon(Icons.verified, color: Color(0xFFFF6B2B), size: 14),
                          ],
                        ]),
                        const SizedBox(height: 2),
                        Text(f['skill'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Row(children: [
                          const Icon(Icons.star, color: Color(0xFFFFC107), size: 14),
                          const SizedBox(width: 4),
                          Text('${f['rating']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(color: const Color(0xFFF0F0F0), borderRadius: BorderRadius.circular(8)),
                            child: Text(f['level'], style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600)),
                          ),
                        ]),
                      ])),
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FreelancerDetailScreen(freelancer: f))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(border: Border.all(color: const Color(0xFFFF6B2B)), borderRadius: BorderRadius.circular(20)),
                          child: const Text('Hire', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ),
                    ]),
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
    final dummyTasks = [
      {'title': 'Design a logo for my brand', 'category': 'Design', 'budget': 'PKR 5,000', 'bids': 3, 'deadline': '15/6/2026', 'status': 'Open'},
      {'title': 'Build a landing page in Flutter', 'category': 'Tech', 'budget': 'PKR 15,000', 'bids': 7, 'deadline': '20/6/2026', 'status': 'Open'},
      {'title': 'Write 5 SEO blog posts', 'category': 'Marketing', 'budget': 'PKR 8,000', 'bids': 2, 'deadline': '18/6/2026', 'status': 'In Progress'},
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('My Tasks', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
          ElevatedButton.icon(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PostTaskScreen())),
            icon: const Icon(Icons.add, size: 16),
            label: const Text('New'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ]),
        const SizedBox(height: 16),
        ...dummyTasks.map((task) => Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(child: Text(task['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0A0A0A)))),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: task['status'] == 'Open' ? Colors.green.withOpacity(0.1) : const Color(0xFFFF6B2B).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(task['status'] as String, style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w600,
                  color: task['status'] == 'Open' ? Colors.green : const Color(0xFFFF6B2B),
                )),
              ),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.category_outlined, size: 13, color: Colors.grey),
              const SizedBox(width: 4),
              Text(task['category'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(width: 16),
              const Icon(Icons.payments_outlined, size: 13, color: Colors.grey),
              const SizedBox(width: 4),
              Text(task['budget'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ]),
            const SizedBox(height: 6),
            Row(children: [
              const Icon(Icons.people_outline, size: 13, color: Color(0xFFFF6B2B)),
              const SizedBox(width: 4),
              Text('${task['bids']} bids received', style: const TextStyle(fontSize: 12, color: Color(0xFFFF6B2B), fontWeight: FontWeight.w600)),
              const Spacer(),
              const Icon(Icons.calendar_today_outlined, size: 13, color: Colors.grey),
              const SizedBox(width: 4),
              Text(task['deadline'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ]),
          ]),
        )),
      ],
    );
  }

  Widget _messagesTab() {
    final conversations = [
      {'name': 'Ayesha Khan', 'lastMsg': 'Sure, I can start tomorrow!', 'time': '2m ago', 'unread': 2, 'online': true},
      {'name': 'Bilal Ahmed', 'lastMsg': 'I sent you the draft video.', 'time': '1h ago', 'unread': 0, 'online': false},
      {'name': 'Sara Malik', 'lastMsg': 'Thank you for the order 🙏', 'time': 'Yesterday', 'unread': 1, 'online': true},
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 8),
        const Text('Messages', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
        const SizedBox(height: 16),
        ...conversations.map((c) => GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(name: c['name'] as String))),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
            ),
            child: Row(children: [
              Stack(children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: const Color(0xFFFF6B2B).withOpacity(0.1),
                  child: Text((c['name'] as String)[0], style: const TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                if (c['online'] as bool)
                  Positioned(
                    right: 0, bottom: 0,
                    child: Container(
                      width: 12, height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ]),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(c['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0A0A0A))),
                const SizedBox(height: 4),
                Text(c['lastMsg'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey), maxLines: 1, overflow: TextOverflow.ellipsis),
              ])),
              const SizedBox(width: 8),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(c['time'] as String, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                const SizedBox(height: 6),
                if ((c['unread'] as int) > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(color: const Color(0xFFFF6B2B), borderRadius: BorderRadius.circular(10)),
                    child: Text('${c['unread']}', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
              ]),
            ]),
          ),
        )),
      ],
    );
  }

  Widget _profileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
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
          decoration: BoxDecoration(color: const Color(0xFFFF6B2B).withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
          child: Text(widget.role == 'client' ? 'Client' : 'Freelancer',
              style: const TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w600, fontSize: 13)),
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
            onPressed: () => Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => const WelcomeScreen()), (route) => false),
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ),
      ]),
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
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PostTaskScreen())),
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
// ══════════════════════════════════════════
// FREELANCER HOME SCREEN
// ══════════════════════════════════════════
class FreelancerHomeScreen extends StatefulWidget {
  const FreelancerHomeScreen({super.key});
  @override
  State<FreelancerHomeScreen> createState() => _FreelancerHomeScreenState();
}

class _FreelancerHomeScreenState extends State<FreelancerHomeScreen> {
  int _selectedIndex = 0;
  String? _selectedCategory;

  final List<String> _categories = ['All', 'Tech', 'Design', 'Video', 'Marketing', 'AI', 'Tuition', 'Home', 'Business'];

  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Design a logo for my startup', 'category': 'Design', 'budget': 'PKR 5,000', 'deadline': '15/6/2026', 'bids': 3, 'desc': 'Need a professional logo for my new startup. Brand colors are blue and white. Minimal design preferred.'},
    {'title': 'Build a Flutter landing page', 'category': 'Tech', 'budget': 'PKR 15,000', 'deadline': '20/6/2026', 'bids': 7, 'desc': 'Need a simple landing page for my app in Flutter web. Should have hero section, features, and contact form.'},
    {'title': 'Write 5 SEO blog posts', 'category': 'Marketing', 'budget': 'PKR 8,000', 'deadline': '18/6/2026', 'bids': 2, 'desc': 'Need 5 SEO-optimized blog posts about digital marketing. Each post should be 800-1000 words.'},
    {'title': 'Edit a 60-second promo video', 'category': 'Video', 'budget': 'PKR 6,000', 'deadline': '17/6/2026', 'bids': 5, 'desc': 'Need a 60-second promotional video edited for my product launch. Raw footage will be provided.'},
    {'title': 'Set up AI chatbot for my website', 'category': 'AI', 'budget': 'PKR 12,000', 'deadline': '22/6/2026', 'bids': 1, 'desc': 'Need an AI chatbot integrated into my WordPress website. Should answer FAQs and capture leads.'},
    {'title': 'Online Maths tuition for O-levels', 'category': 'Tuition', 'budget': 'PKR 4,000', 'deadline': '25/6/2026', 'bids': 4, 'desc': 'Need a maths tutor for my child preparing for O-levels. 2 hours per week for one month.'},
  ];

  List<Map<String, dynamic>> get _filteredTasks {
    if (_selectedCategory == null || _selectedCategory == 'All') return _tasks;
    return _tasks.where((t) => t['category'] == _selectedCategory).toList();
  }

  Widget _homeTab() {
    return Column(
      children: [
        // Top bar
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Row(children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(color: const Color(0xFFFF6B2B), borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.flutter_dash, color: Colors.white, size: 26),
            ),
            const SizedBox(width: 12),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Welcome back 👋', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Browse available tasks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
            ])),
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
              ),
              child: const Icon(Icons.notifications_none, color: Color(0xFF0A0A0A)),
            ),
          ]),
        ),
        // Search bar
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Color(0xFFFF6B2B)),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        // Categories
        const SizedBox(height: 14),
        SizedBox(
          height: 38,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, i) {
              final cat = _categories[i];
              final selected = _selectedCategory == cat || (_selectedCategory == null && cat == 'All');
              return GestureDetector(
                onTap: () => setState(() => _selectedCategory = cat == 'All' ? null : cat),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFFFF6B2B) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: selected ? const Color(0xFFFF6B2B) : const Color(0xFFE0E0E0)),
                  ),
                  child: Text(cat, style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : Colors.grey.shade700,
                  )),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        // Tasks list
        Expanded(
          child: _filteredTasks.isEmpty
              ? const Center(child: Text('No tasks in this category', style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _filteredTasks.length,
                  itemBuilder: (_, i) {
                    final task = _filteredTasks[i];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TaskDetailScreen(task: task))),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Row(children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6B2B).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(task['category'] as String, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFFF6B2B))),
                            ),
                            const Spacer(),
                            const Icon(Icons.access_time, size: 13, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(task['deadline'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ]),
                          const SizedBox(height: 10),
                          Text(task['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0A0A0A))),
                          const SizedBox(height: 6),
                          Text(task['desc'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 12),
                          Row(children: [
                            const Icon(Icons.payments_outlined, size: 14, color: Color(0xFF0A0A0A)),
                            const SizedBox(width: 4),
                            Text(task['budget'] as String, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
                            const Spacer(),
                            const Icon(Icons.people_outline, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text('${task['bids']} bids', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6B2B),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text('Bid Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                            ),
                          ]),
                        ]),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _myBidsTab() {
    final myBids = [
      {'title': 'Design a logo for my startup', 'myBid': 'PKR 4,500', 'status': 'Pending', 'deadline': '15/6/2026'},
      {'title': 'Edit a 60-second promo video', 'myBid': 'PKR 5,500', 'status': 'Accepted', 'deadline': '17/6/2026'},
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 8),
        const Text('My Bids', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
        const SizedBox(height: 16),
        ...myBids.map((bid) => Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(child: Text(bid['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0A0A0A)))),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: bid['status'] == 'Accepted' ? Colors.green.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(bid['status'] as String, style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w600,
                  color: bid['status'] == 'Accepted' ? Colors.green : Colors.orange,
                )),
              ),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Icon(Icons.payments_outlined, size: 14, color: Color(0xFFFF6B2B)),
              const SizedBox(width: 4),
              Text('Your bid: ${bid['myBid']}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFFFF6B2B))),
              const Spacer(),
              const Icon(Icons.calendar_today_outlined, size: 13, color: Colors.grey),
              const SizedBox(width: 4),
              Text(bid['deadline'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ]),
          ]),
        )),
      ],
    );
  }

  Widget _messagesTab() {
    final conversations = [
      {'name': 'Ahmed Ali', 'lastMsg': 'Can you start by Monday?', 'time': '5m ago', 'unread': 1, 'online': true},
      {'name': 'Fatima Khan', 'lastMsg': 'Please send your portfolio', 'time': '2h ago', 'unread': 0, 'online': false},
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 8),
        const Text('Messages', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
        const SizedBox(height: 16),
        ...conversations.map((c) => GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(name: c['name'] as String))),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
            ),
            child: Row(children: [
              Stack(children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: const Color(0xFFFF6B2B).withOpacity(0.1),
                  child: Text((c['name'] as String)[0], style: const TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                if (c['online'] as bool)
                  Positioned(right: 0, bottom: 0,
                    child: Container(width: 12, height: 12,
                      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                    ),
                  ),
              ]),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(c['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0A0A0A))),
                const SizedBox(height: 4),
                Text(c['lastMsg'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey), maxLines: 1, overflow: TextOverflow.ellipsis),
              ])),
              const SizedBox(width: 8),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(c['time'] as String, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                const SizedBox(height: 6),
                if ((c['unread'] as int) > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(color: const Color(0xFFFF6B2B), borderRadius: BorderRadius.circular(10)),
                    child: Text('${c['unread']}', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
              ]),
            ]),
          ),
        )),
      ],
    );
  }

  Widget _profileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const SizedBox(height: 20),
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFFFF6B2B).withOpacity(0.1),
              child: const Icon(Icons.person, color: Color(0xFFFF6B2B), size: 50),
            ),
            Positioned(
              right: 0, bottom: 0,
              child: Container(
                width: 28, height: 28,
                decoration: const BoxDecoration(color: Color(0xFFFF6B2B), shape: BoxShape.circle),
                child: const Icon(Icons.edit, color: Colors.white, size: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        const Text('Your Name', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
        const SizedBox(height: 4),
        const Text('your@email.com', style: TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(color: const Color(0xFFFF6B2B).withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: const Text('Freelancer', style: TextStyle(color: Color(0xFFFF6B2B), fontWeight: FontWeight.w600, fontSize: 13)),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: const Text('Level 1', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 13)),
          ),
        ]),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _statBox('0', 'Orders'),
          _statBox('0', 'Reviews'),
          _statBox('0', 'Earnings'),
        ]),
        const SizedBox(height: 24),
        _profileTile(Icons.person_outline, 'Edit Profile'),
        _profileTile(Icons.work_outline, 'My Skills'),
        _profileTile(Icons.photo_library_outlined, 'Portfolio'),
        _profileTile(Icons.lock_outline, 'Change Password'),
        _profileTile(Icons.help_outline, 'Help & Support'),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => const WelcomeScreen()), (route) => false),
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _statBox(String value, String label) {
    return Column(children: [
      Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
    ]);
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
            _myBidsTab(),
            _messagesTab(),
            _profileTab(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF6B2B),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.gavel_outlined), activeIcon: Icon(Icons.gavel), label: 'My Bids'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), activeIcon: Icon(Icons.chat_bubble), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════
// TASK DETAIL SCREEN
// ══════════════════════════════════════════
class TaskDetailScreen extends StatefulWidget {
  final Map<String, dynamic> task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final TextEditingController _bidController = TextEditingController();
  final TextEditingController _proposalController = TextEditingController();
  bool _showBidForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0A0A0A)), onPressed: () => Navigator.pop(context)),
        title: const Text('Task Detail', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Task card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFFFF6B2B).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Text(widget.task['category'] as String, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFFF6B2B))),
              ),
              const SizedBox(height: 12),
              Text(widget.task['title'] as String, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
              const SizedBox(height: 12),
              Text(widget.task['desc'] as String, style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.6)),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 12),
              Row(children: [
                _infoItem(Icons.payments_outlined, 'Budget', widget.task['budget'] as String),
                const SizedBox(width: 24),
                _infoItem(Icons.calendar_today_outlined, 'Deadline', widget.task['deadline'] as String),
                const SizedBox(width: 24),
                _infoItem(Icons.people_outline, 'Bids', '${widget.task['bids']} placed'),
              ]),
            ]),
          ),
          const SizedBox(height: 20),

          // Bid form
          if (_showBidForm) ...[
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Place Your Bid', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
                const SizedBox(height: 16),
                const Text('Your Bid Amount (PKR)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
                const SizedBox(height: 8),
                TextField(
                  controller: _bidController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your bid amount',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.payments_outlined, color: Color(0xFFFF6B2B)),
                    filled: true, fillColor: const Color(0xFFF8F8F8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Proposal', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0A0A0A))),
                const SizedBox(height: 8),
                TextField(
                  controller: _proposalController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Why should the client hire you? Describe your approach...',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                    filled: true, fillColor: const Color(0xFFF8F8F8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFFF6B2B), width: 1.5)),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Bid placed successfully! 🎉'), backgroundColor: Color(0xFFFF6B2B)),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), elevation: 0,
                    ),
                    child: const Text('Submit Bid', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                  ),
                ),
              ]),
            ),
          ] else ...[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => setState(() => _showBidForm = true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B2B), foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), elevation: 0,
                ),
                child: const Text('Place a Bid', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen(name: 'Client'))),
                icon: const Icon(Icons.chat_bubble_outline, size: 18),
                label: const Text('Message Client'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFFF6B2B),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: Color(0xFFFF6B2B)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
          ],
          const SizedBox(height: 32),
        ]),
      ),
    );
  }

  Widget _infoItem(IconData icon, String label, String value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(icon, size: 14, color: const Color(0xFFFF6B2B)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ]),
      const SizedBox(height: 4),
      Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0A0A0A))),
    ]);
  }
}