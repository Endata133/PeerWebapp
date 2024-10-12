import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RegisterButton extends StatelessWidget {
  final String registerMutation;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isSubmitting;
  final Function(bool) onSubmit;
  final Function(String) onRegisterSuccess;
  final Function(String) onRegisterFailure;

  const RegisterButton({
    Key? key,
    required this.registerMutation,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isSubmitting,
    required this.onSubmit,
    required this.onRegisterSuccess,
    required this.onRegisterFailure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(registerMutation),
        onCompleted: (dynamic resultData) {
          if (resultData != null && resultData['register']['status'] == 'success') {
            onRegisterSuccess(resultData['register']['userid']);
          } else {
            onRegisterFailure(resultData['register']['errorMessage'] ?? 'Registration failed');
          }
        },
        onError: (OperationException? error) {
          final errorMessage = error?.graphqlErrors.isNotEmpty == true
              ? error?.graphqlErrors.first.message
              : 'An unknown error occurred';
          onRegisterFailure(errorMessage ?? 'An unknown error occurred');
        },
      ),
      builder: (RunMutation runMutation, QueryResult? result) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isSubmitting ? null : () => _onRegisterPressed(context, runMutation),
            child: isSubmitting
                ? CircularProgressIndicator(color: Colors.white)
                : Text('Register'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.blue[300],
            ),
          ),
        );
      },
    );
  }

  void _onRegisterPressed(BuildContext context, RunMutation runMutation) {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }

    if (!_isValidEmail(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid email address")),
      );
      return;
    }

    onSubmit(true); // Set submitting to true

    runMutation({
      'username': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    });
  }

  bool _isValidEmail(String email) {
    return email.isNotEmpty && email.contains('@');
  }
}
