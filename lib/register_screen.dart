import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final String registerAndVerifyMutation = """
    mutation RegisterAndVerify(\$username: String!, \$email: String!, \$password: String!, \$userid: String!) {
      verifiedAccount(userid: \$userid) {
        status
        errorMessage
        accessToken
        refreshToken
      }
      register(input: { email: \$email, password: \$password, username: \$username }) {
        token
        user {
          id
          email
        }
      }
    }
  """;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final String userid = "fd2a9d00-0fb1-42c2-ba0a-7ebd3f82b2f8"; // Assuming this is a fixed ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Background color #1E1E1E
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300], // Light background for the left side
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/PeerSignet_Color_RGB.png',
                    width: 150,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get started!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 250, 250, 1.0), // Light text color
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Almost like with any social media you can share the content you love, but with peer, you earn on the side – no fame needed!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(255, 250, 250, 1.0), // Light text color
                      ),
                    ),
                    SizedBox(height: 40),
                    _buildTextField('Username', _usernameController),
                    SizedBox(height: 20),
                    _buildTextField('Email', _emailController),
                    SizedBox(height: 20),
                    _buildPasswordField('Password', _passwordController),
                    SizedBox(height: 20),
                    _buildPasswordField('Confirm Password', _confirmPasswordController),
                    SizedBox(height: 30),
                    _buildRegisterButton(),
                    SizedBox(height: 20),
                    _buildSignInText(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[850], // Dark background for the input fields
        hintStyle: TextStyle(color: Colors.grey[500]), // Light grey hint text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Color.fromRGBO(255, 250, 250, 1.0)), // White input text
    );
  }

  Widget _buildPasswordField(String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[850], // Dark background for input field
        hintStyle: TextStyle(color: Colors.grey[500]), // Light grey hint text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(Icons.visibility, color: Colors.grey[500]), // Grey icon for password visibility
      ),
      obscureText: true,
      style: TextStyle(color: Color.fromRGBO(255, 250, 250, 1.0)), // White input text
    );
  }

  Widget _buildRegisterButton() {
    return Mutation(
      options: MutationOptions(
        document: gql(registerAndVerifyMutation),
        onCompleted: (dynamic resultData) {
          if (resultData != null) {
            print("Registration and Verification successful");
            print(resultData);
          }
        },
        onError: (OperationException? error) {
          if (error != null) {
            print("Error: ${error.toString()}");
          }
        },
      ),
      builder: (RunMutation runMutation, QueryResult? result) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Check if passwords match
              if (_passwordController.text != _confirmPasswordController.text) {
                print("Passwords do not match!");
                return;
              }

              // Call the mutation with form values
              runMutation({
                'username': _usernameController.text,
                'email': _emailController.text,
                'password': _passwordController.text,
                'userid': userid,
              });
            },
            child: Text('Register'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.blue[300], // Light blue button color
            ),
          ),
        );
      },
    );
  }

  Widget _buildSignInText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(color: Color.fromRGBO(255, 250, 250, 1.0)), // Light text color for consistency
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // Go back to the login screen
          },
          child: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.blue[300], // Light blue color for sign-in link
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
