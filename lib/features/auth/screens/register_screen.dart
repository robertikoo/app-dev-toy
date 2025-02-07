import 'package:flutter/material.dart';
import '/features/common/widgets/custom_button.dart';
import '/features/common/widgets/custom_textfield.dart';
import '/features/common/widgets/custom_dropdown.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _acceptTerms = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomTextField(
                  label: 'Nombre completo',
                  hintText: 'Nombre como aparece en tu documento de identidad',
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  label: 'Nombre completo',
                  hintText: 'Apellido como aparece en tu documento de identidad',
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  label: 'Fecha de nacimiento',
                ),
                const Text(
                  'Para registrarte debes ser mayor de edad',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  label: 'Región',
                  hint: 'Selecciona tu región',
                  items: const ['Región 1', 'Región 2', 'Región 3'], // Add your regions
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  label: 'Comuna',
                  hint: 'Selecciona tu comuna',
                  items: const ['Comuna 1', 'Comuna 2', 'Comuna 3'], // Add your comunas
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  label: 'Correo electrónico',
                  suffixText: '@gmail.com',
                ),
                const Text(
                  'Te enviaremos los resúmenes de tus cuidados',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  label: 'Contraseña',
                  isPassword: true,
                  hintText: 'contraseña',
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = value ?? false;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Al aceptar, confirmas que has leído y aceptas nuestros términos del servicio y Política de privacidad',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Aceptar y continuar',
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _acceptTerms) {
                      // Handle registration
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
