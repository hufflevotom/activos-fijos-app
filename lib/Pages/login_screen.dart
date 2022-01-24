import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:activos_fijos_app/Providers/login_form_provider.dart';
import 'package:activos_fijos_app/Services/services.dart';
import 'package:activos_fijos_app/Utils/Styles/styles.dart';
import 'package:activos_fijos_app/Utils/Widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorBackground(
        color: CustomColors.azul_80,
        child: SingleChildScrollView(
          child: Center(
            child: CustomCard(
              color: CustomColors.blanco,
              child: Column(
                children: [
                  Image.asset('lib/Utils/Images/logo.png'),
                  const SizedBox(height: 40),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.inputStyle(
              hintText: 'Nombre de usuario',
              prefixIcon: Icons.account_circle_outlined,
            ),
            onChanged: (value) => loginForm.user = value,
          ),
          const SizedBox(height: 15),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.inputStyle(
              hintText: 'Contraseña',
              prefixIcon: Icons.password,
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              if (value != null && value.length >= 3) return null;
              return 'Ingrese la contraseña';
            },
          ),
          const SizedBox(height: 15),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: CustomColors.gris_100,
            elevation: 0,
            color: CustomColors.azul_100,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Center(
                child: Text(
                  loginForm.isLoading ? 'Buscando usuario ...' : 'Ingresar',
                  style: TextStyle(
                    color: CustomColors.blanco,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final loginService =
                        Provider.of<LoginService>(context, listen: false);
                    // if (!loginForm.isValidForm()) return;
                    loginForm.isLoading = true;
                    final String? errorMessage = await loginService.login(
                        loginForm.user, loginForm.password);
                    if (errorMessage == null) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      //TODO: Mostrar una alerta
                      print(errorMessage);
                      loginForm.isLoading = false;
                    }
                  },
          ),
        ],
      ),
    );
  }
}
