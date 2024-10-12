import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final String registerMutation = """
    mutation Register(\$username: String!, \$email: String!, \$password: String!) {
      register(input: { email: \$email, password: \$password, username: \$username }) {
        errorMessage
        userid
        status
      }
    }
  """;

  final String verifyMutation = """
    mutation VerifiedAccount(\$userid: String!) {
      verifiedAccount(userid: \$userid) {
        status
        errorMessage
        accessToken
        refreshToken
      }
    }
  """;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(70)),
              child: Container(
                color: Colors.grey[300],
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
                        color: Color.fromRGBO(255, 250, 250, 1.0),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Almost like any social media, share content you love and earn on the side – no fame needed!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(255, 250, 250, 1.0),
                      ),
                    ),
                    SizedBox(height: 40),
                    _buildTextField('Username', _usernameController),
                    SizedBox(height: 20),
                    _buildTextField('Email', _emailController),
                    SizedBox(height: 20),
                    _buildPasswordField('Password', _passwordController, _passwordVisible, (value) {
                      setState(() {
                        _passwordVisible = value;
                      });
                    }),
                    SizedBox(height: 20),
                    _buildPasswordField('Confirm Password', _confirmPasswordController, _confirmPasswordVisible, (value) {
                      setState(() {
                        _confirmPasswordVisible = value;
                      });
                    }),
                    SizedBox(height: 30),
                    _buildRegisterButton(),
                    SizedBox(height: 20),
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
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
        fillColor: Colors.grey[850],
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Color.fromRGBO(255, 250, 250, 1.0)),
    );
  }

  Widget _buildPasswordField(String hintText, TextEditingController controller, bool visible, Function(bool) onVisibilityChanged) {
    return TextField(
      controller: controller,
      obscureText: !visible,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[850],
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            visible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[500],
          ),
          onPressed: () => onVisibilityChanged(!visible),
        ),
      ),
      style: TextStyle(color: Color.fromRGBO(255, 250, 250, 1.0)),
    );
  }

  Widget _buildRegisterButton() {
    return Mutation(
      options: MutationOptions(
        document: gql(registerMutation),
        onCompleted: (dynamic resultData) {
          if (resultData != null && resultData['register']['status'] == 'SUCCESS') {
            _verifyAccount(resultData['register']['userid']);
          } else {
            setState(() {
              _errorMessage = resultData['register']['errorMessage'] ?? 'Registration failed';
            });
          }
        },
        onError: (OperationException? error) {
          setState(() {
            _errorMessage = error?.graphqlErrors.isNotEmpty == true
                ? error?.graphqlErrors.first.message
                : 'An unknown error occurred';
          });
        },
      ),
      builder: (RunMutation runMutation, QueryResult? result) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_passwordController.text != _confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Passwords do not match!")),
                );
                return;
              }

              if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please enter a valid email address")),
                );
                return;
              }

              setState(() {
                _isSubmitting = true;
              });

              runMutation({
                'username': _usernameController.text,
                'email': _emailController.text,
                'password': _passwordController.text,
              });
            },
            child: _isSubmitting ? CircularProgressIndicator(color: Colors.white) : Text('Register'),
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

  void _verifyAccount(String userid) {
    final MutationOptions options = MutationOptions(
      document: gql(verifyMutation),
      variables: {
        'userid': userid,
      },
      onCompleted: (dynamic resultData) {
        if (resultData != null && resultData['verifiedAccount']['status'] == 'SUCCESS') {
          // Handle successful account verification
          print('Account verified successfully');
        } else {
          setState(() {
            _errorMessage = resultData['verifiedAccount']['errorMessage'] ?? 'Verification failed';
          });
        }
      },
      onError: (OperationException? error) {
        setState(() {
          _errorMessage = error?.graphqlErrors.isNotEmpty == true
              ? error?.graphqlErrors.first.message
              : 'Verification failed';
        });
      },
    );

    GraphQLProvider.of(context).value.mutate(options);
  }

  Widget _buildSignInText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(color: Color.fromRGBO(255, 250, 250, 1.0)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.blue[300],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
