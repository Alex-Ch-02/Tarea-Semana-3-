import 'package:flutter/material.dart';
import 'pages/pagina1.dart'; // Pagina "Nosotros"
import 'pages/pagina2.dart'; // Pagina "Contactos"
import 'pages/paginaCard.dart';
import 'pages/formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegacion',
      initialRoute: "splash",
      routes: {
        "splash": (BuildContext context) => const SplashScreen(),
        "pagina1": (BuildContext context) => const Pagina1(),
        "pagina2": (BuildContext context) => const Pagina2(),
        "paginaCard": (BuildContext context) => PaginaCard(),
        "Formulario": (BuildContext context) =>
            const Formulario(), // Nueva ruta
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Inicializamos el controlador con una duración de 2 segundos
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Definimos el Tween para animar el tamaño de la imagen
    _animation = Tween<double>(begin: 100, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {}); // Actualiza la UI cuando la animación cambia
      });

    // Comenzamos la animación
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberamos el controlador cuando no se necesite
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 31, 129, 119), // Fondo turquesa
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animación de la imagen
              Image.asset(
                'assets/Uisrael.jpg',
                width: _animation.value, // Aplicamos la animación al ancho
                height: _animation.value, // Aplicamos la animación al alto
              ),
              const SizedBox(height: 20),
              const Text(
                "Bienvenido a la App de Videojuegos",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 10, 10)),
              ),
              const SizedBox(height: 40),
              // Botón para navegar a la página de "Nosotros"
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "pagina1");
                },
                child: const Text("Nosotros"),
              ),
              const SizedBox(height: 20),
              // Botón para navegar a la página de "Contactos"
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "pagina2");
                },
                child: const Text("Contactos"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "paginaCard");
                },
                child: const Text("Juegos"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Formulario");
                },
                child: const Text("Formulario"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
