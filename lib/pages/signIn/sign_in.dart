import 'package:flutter/material.dart';
import '../../routes/guest_routes.dart';
import './validators/signin_validators.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Placeholder
                  const Image(
                    image: AssetImage(
                        "images/logo.png"), // Make sure the logo is in this path
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildTextField(
                    'Masukan Email',
                    false,
                    (value) => Validators.validateEmail(value),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    'Masukan Password',
                    true,
                    (value) => Validators.validatePassword(value),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () =>
                            GuestRoutes.navigateToRegister(context),
                        child: const Text(
                          'Daftar',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            GuestRoutes.navigateToForgotPassword(context),
                        child: const Text(
                          'Lupa password?',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Navigasi ke halaman home jika validasi berhasil
                        GuestRoutes.navigateToHome(context);
                      }
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    bool isPassword,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
      validator: validator,
    );
  }
}
