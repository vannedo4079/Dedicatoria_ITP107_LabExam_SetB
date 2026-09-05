import 'package:flutter/material.dart';

void main() {
  runApp(const DedicatoriaSignUpApp());
}

class DedicatoriaSignUpApp extends StatelessWidget {
  const DedicatoriaSignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dedicatoria_ITP107_LabExam_SetB).',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF15131B),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFBFA6D9),
          brightness: Brightness.dark,
        ).copyWith(
          primary: const Color(0xFFD7BDE2),
          secondary: const Color(0xFF9ED8C5),
          surface: const Color(0xFF211D29),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF282331),
          labelStyle: const TextStyle(color: Color(0xFFD7C8DF)),
          hintStyle: const TextStyle(color: Color(0xFF928A9C)),
          prefixIconColor: const Color(0xFFD7BDE2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF50445C)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF50445C)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFD7BDE2), width: 2),
          ),
        ),
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _agreeToTerms = false;
  bool _hidePassword = true;

  // Replace this value with your real full name before submitting.
  static const String presenterFullName = 'Donovanne L. Dedicatoria';

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitSignUp() {
    if (!_formKey.currentState!.validate()) return;

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the terms first.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account details are ready to submit.')),
    );
  }

  void _printHelloWorld() {
    debugPrint('Hello World!');
  }

  void _printCourseInformation() {
    debugPrint(
      'ITP107 - Programming with Mobile Technologies and Applications',
    );
  }

  void _printFullName() {
    debugPrint('Full Name: $presenterFullName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF292238),
                Color(0xFF15131B),
                Color(0xFF101A19),
              ],
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(22, 26, 22, 30),
            children: [
              _buildHeader(),
              const SizedBox(height: 22),
              _buildSignUpCard(),
              const SizedBox(height: 18),
              _buildGestureCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFD7BDE2),
                  Color(0xFF9ED8C5),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD7BDE2).withValues(alpha: 0.5),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            padding: const EdgeInsets.all(3),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF15131B),
              ),
              padding: const EdgeInsets.all(8),
              child: ClipOval(
                child: Image.asset(
                  'assets/signup_logo_s.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF3B3049),
                      child: const Icon(
                        Icons.nightlight_round,
                        color: Color(0xFFD7BDE2),
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Sign Up Design Application',
            style: TextStyle(
              color: Color(0xFFF2EAF5),
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Please input the required informations',
            style: TextStyle(
              color: Color(0xFFBDAFC8),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpCard() {
    return Card(
      elevation: 10,
      shadowColor: Colors.black54,
      color: const Color(0xE6211D29),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),
        side: const BorderSide(color: Color(0xFF584A65)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xFFD7BDE2),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Begin your story in a darker shade.',
                style: TextStyle(color: Color(0xFFAAA0B2)),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _fullNameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Full name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your full name.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'you@example.com',
                  prefixIcon: Icon(Icons.mail_outline),
                ),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _passwordController,
                obscureText: _hidePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'At least 8 characters',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _hidePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() => _hidePassword = !_hidePassword);
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'Use at least 8 characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    activeColor: const Color(0xFF9ED8C5),
                    checkColor: const Color(0xFF17201C),
                    onChanged: (value) {
                      setState(() => _agreeToTerms = value ?? false);
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'I agree to the terms and privacy policy.',
                      style: TextStyle(color: Color(0xFFBDAFC8)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submitSignUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD7BDE2),
                  foregroundColor: const Color(0xFF271E2E),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGestureCard() {
    return Card(
      color: const Color(0xCC282331),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: Color(0xFF4F765F)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Text(
              'Gesture Console Test',
              style: TextStyle(
                color: Color(0xFF9ED8C5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Try the gestures below and watch Android Studio\'s Debug Console.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFFBDAFC8)),
            ),
            const SizedBox(height: 14),
            GestureDetector(
              onTap: _printHelloWorld,
              onDoubleTap: _printCourseInformation,
              onLongPress: _printFullName,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF9ED8C5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Click Me',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF17201C),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: Color(0xFF51475A)),
            const SizedBox(height: 8),
            const Text(
              'Single tap: Hello World!\nDouble tap: ITP107 information\nLong press: presenter name',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFAAA0B2),
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
