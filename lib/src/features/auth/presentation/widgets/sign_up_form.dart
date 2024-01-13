import 'package:dbtech_tdd_clean_archecture_bloc/src/core/commons/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.fullNameController,
    required this.formKey,
    super.key,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController fullNameController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool obscurePassword = true;
  bool confirmObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          InputTextFeild(
            controller: widget.fullNameController,
            hintText: 'Full name',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 25),
          InputTextFeild(
            controller: widget.emailController,
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 25),
          InputTextFeild(
            controller: widget.passwordController,
            hintText: 'Password',
            obscureText: obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword ? IconlyLight.show : IconlyLight.hide,
                color: Colors.grey,
              ),
              onPressed: () => setState(() {
                obscurePassword = !obscurePassword;
              }),
            ),
          ),
          const SizedBox(height: 25),
          InputTextFeild(
            controller: widget.confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: confirmObscurePassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              icon: Icon(
                confirmObscurePassword ? IconlyLight.show : IconlyLight.hide,
                color: Colors.grey,
              ),
              onPressed: () => setState(() {
                confirmObscurePassword = !confirmObscurePassword;
              }),
            ),
            validator: (value) {
              if (value != widget.passwordController.text) {
                return 'Password do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
