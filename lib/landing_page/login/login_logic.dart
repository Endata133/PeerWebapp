import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql_client.dart'; // Import your GraphQL client setup

// Handles login button press asynchronously
Future<void> handleLogin(BuildContext context, String email, String password) async {
  try {
    // Call your GraphQL or API logic for verifying and logging in
    final client = await getGraphQLClient();
    const String verifiedAccountMutation = """
      mutation VerifiedAccount(\$email: String!, \$password: String!) {
        verifiedAccount {
          errorMessage
        }
        login(email: \$email, password: \$password) {
          status
        }
      }
    """;

    final MutationOptions options = MutationOptions(
      document: gql(verifiedAccountMutation),
      variables: {
        'email': email,
        'password': password,
      },
    );

    final result = await client.mutate(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    // Check if there was an error message for verification
    final String? errorMessage = result.data?['verifiedAccount']['errorMessage'];
    final String status = result.data?['login']['status'];

    if (errorMessage != null && errorMessage.isNotEmpty) {
      // Display error message if account verification failed
      throw Exception(errorMessage);
    }

    if (status == 'SUCCESS') {
      // Navigate to the home or main screen upon successful login
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      throw Exception('Login failed, please check your credentials.');
    }
  } catch (e) {
    // Handle any login error (like failed network request, invalid credentials, etc.)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login failed: ${e.toString()}')),
    );
  }
}

// Handles forgot password navigation
void handleForgotPassword(BuildContext context) {
  // Navigate to the Forgot Password screen
  Navigator.pushNamed(context, '/forgot-password');
}

// Handles sign-up button press
void handleSignUp(BuildContext context) {
  // Navigate to the registration screen
  Navigator.pushNamed(context, '/register');
}

class LoginLogic {
  // Function to handle login using GraphQL
  Future<bool> handleLogin(String email, String password) async {
    final client = await getGraphQLClient();
    const String loginMutation = """
      mutation Login(\$email: String!, \$password: String!) {
        login(email: \$email, password: \$password) {
          token
        }
      }
    """;

    final MutationOptions options = MutationOptions(
      document: gql(loginMutation),
      variables: {
        'email': email,
        'password': password,
      },
    );

    final result = await client.mutate(options);

    if (result.hasException) {
      print(result.exception.toString());
      return false;
    }

    // If login is successful, retrieve the token
    final String? token = result.data?['login']['token'];
    if (token != null) {
      print('Login successful, token: $token');
      // Store the token securely using flutter_secure_storage if needed
      return true;
    }

    return false;
  }
}