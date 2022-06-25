import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.Signup;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  void _submit() {
    final isValid = _formkey.currentState?.validate() ?? false;
    if (isValid) {
      return;
    }
    setState(() => _isLoading = true);

    _formkey.currentState?.save;

    if (_isLogin()) {
      // login
    } else {
      // Registrar
    }

    setState(() => _isLoading = true);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            padding: const EdgeInsets.all(10),
            height: _isLogin() ? 320 : 350,
            width: deviceSize.width * 0.75,
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(labelText: 'E-mail'),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (email) => _authData['email'] = email ?? '',
                        validator: (_email) {
                          final email = _email ?? '';
                          if (email.trim().isEmpty || !email.contains('@')) {
                            return 'Informe um e-mail Válido.';
                          }
                          return null;
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Senha'),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        onSaved: (password) =>
                            _authData['password'] = password ?? '',
                        validator: (_password) {
                          final password = _password ?? '';
                          if (password.isEmpty || password.length > 8) {
                            return 'Informe uma senha Válida';
                          }
                          return null;
                        }),
                    if (_isSignup())
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Confirmar Senha'),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        controller: _passwordController,
                        validator: _isLogin()
                            ? null
                            : (_password) {
                                final password = _password ?? '';
                                if (password != _passwordController.text) {
                                  return 'Senhas informadas não conferem.';
                                }
                                return null;
                              },
                      ),
                    const SizedBox(height: 20),
                    if (_isLoading)
                      CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text(_authMode == AuthMode.Login
                            ? 'ENTRA'
                            : 'REGISTRAR'),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 8,
                            )),
                      ),
                    Spacer(),
                    TextButton(
                      onPressed: _switchAuthMode,
                      child: Text(_isLogin()
                          ? 'DESEJA REGISTRAR?'
                          : 'JÁ POSSUI CONTA?'),
                    ),
                  ],
                ))));
  }
}
