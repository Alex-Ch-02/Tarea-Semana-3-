import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  String email = '';
  String celular = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de Usuario
              TextFormField(
                decoration: const InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su usuario';
                  }
                  return null;
                },
                onChanged: (value) {
                  username = value;
                },
              ),
              const SizedBox(height: 16),

              // Campo de Clave
              TextFormField(
                decoration: const InputDecoration(labelText: 'Clave'),
                obscureText: true, // Para ocultar la contraseña
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su clave';
                  }
                  return null;
                },
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 16),

              // Campo de Email
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  }
                  // Validación de formato de correo electrónico
                  const emailRegex =
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  if (!RegExp(emailRegex).hasMatch(value)) {
                    return 'Por favor ingrese un correo electrónico válido';
                  }
                  return null;
                },
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 16),

              // Campo de Celular
              TextFormField(
                decoration: const InputDecoration(labelText: 'Celular'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su número de celular';
                  }
                  return null;
                },
                onChanged: (value) {
                  celular = value;
                },
              ),
              const SizedBox(height: 24),

              // Botón de Registro
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, realizar el registro
                    // Aquí puedes agregar la lógica para manejar el registro
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registro exitoso')),
                    );
                  }
                },
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
