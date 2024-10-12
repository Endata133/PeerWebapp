import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'landing_page/login/login_screen.dart';
import 'landing_page/register/register_screen.dart';
import 'landing_page/forgot_password_screen.dart';
import 'landing_page/register/graphql_client.dart';

void main() async {
  // Initialize Hive for Flutter (required by graphql_flutter for caching)
  await initHiveForFlutter();

  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GraphQLClient>(
      future: GraphQLConfig.clientToQuery(), // Wait for the client to be initialized
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the GraphQL client to be initialized
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          // Handle any errors during the client initialization
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error initializing GraphQL client: ${snapshot.error}'),
              ),
            ),
          );
        }

        // Once the GraphQL client is ready, provide it to the app
        return GraphQLProvider(
          client: ValueNotifier(snapshot.data!), // The GraphQL client is now ready
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(), // Initial screen is the LoginScreen
            routes: {
              '/register': (context) => RegisterScreen(), // Route for RegisterScreen
              '/forgot-password': (context) => ForgotPasswordScreen(), // Route for ForgotPasswordScreen
            },
          ),
        );
      },
    );
  }
}
