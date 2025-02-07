import 'package:flutter/material.dart';
import '/features/common/widgets/custom_button.dart';
import '/features/common/widgets/custom_textfield.dart';


class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleRecovery() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement password recovery logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingresa tu correo electrónico y te enviaremos un enlace para que puedas crear una nueva contraseña.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Correo electrónico',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo electrónico';
                    }
                    // Basic email validation
                    if (!value.contains('@')) {
                      return 'Por favor ingresa un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Reestablecer contraseña',
                  onPressed: _handleRecovery,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
