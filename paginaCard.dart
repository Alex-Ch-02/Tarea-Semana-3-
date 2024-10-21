import 'package:flutter/material.dart';
import 'game_detail_page.dart'; // Importa la página de detalles

class PaginaCard extends StatelessWidget {
  final List<Game> games = [
    Game(
      title: "God of War",
      imagePath: "assets/God_of_war.jpg", // Reemplaza con tus imágenes
      description:
          "God of War es un aclamado juego de aventuras y acción desarrollado por Santa Monica Studio. "
          "En este juego, asumes el papel de Kratos, un antiguo dios espartano que busca redención y, al mismo"
          "tiempo, se enfrenta a su destino como padre. Con una narrativa profundamente emocional, Kratos"
          "viaja por los mundos de la mitología nórdica, enfrentándose a dioses, monstruos y criaturas"
          "legendarias.\n"
          "Características:\n"
          "Combate brutal y táctico."
          "Historia cargada de emociones y mitología nórdica."
          "Gráficos de última generación."
          "Puzles desafiantes e interacciones entre Kratos y su hijo Atreus.",
    ),
    Game(
      title: "Mario Bross",
      imagePath: "assets/Mario.jpg", // Reemplaza con tus imágenes
      description:
          "Mario Bros es uno de los videojuegos más icónicos de la historia, desarrollado por Nintendo. En este clásico de plataformas, los jugadores asumen el papel de Mario, un fontanero que debe salvar el Reino Champiñón de las garras de Bowser, el villano principal. A lo largo del juego, Mario salta y corre a través de niveles llenos de obstáculos, enemigos, y misteriosos bloques con poderes especiales.\n"
          "Caracteristicas: \n"
          "Personajes: Mario, Luigi, Bowser, Princesa Peach\n"
          "Niveles variados: Cada nivel presenta desafíos úncos con paisajes coloridos.\n"
          "Poderes especiales: Incluye objetos como la estrella invencible, setas, y la flor de fuego.\n"
          "Modo multijugador: Posibilidad de jugar con un segundo jugador que controla a Luigi.",
    ),
    Game(
      title: "Dota 2",
      imagePath: "assets/dota.jpg", // Reemplaza con tus imágenes
      description:
          "Dota 2 es un popular juego de estrategia en tiempo real y un juego de batalla en línea multijugador (MOBA) desarrollado y publicado por Valve Corporation. Es la secuela de Defense of the Ancients (DotA), un mod de Warcraft III. En Dota 2, dos equipos de cinco jugadores compiten en una intensa batalla para destruir la Ancient del equipo contrario, que es la estructura central ubicada en la base enemiga. Cada jugador controla un héroe con habilidades únicas y se une a sus compañeros de equipo para superar al adversario a través de la estrategia, la cooperación y la habilidad.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juegos"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dos columnas
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameDetailPage(game: games[index]),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        games[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      games[index].title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Game {
  final String title;
  final String imagePath;
  final String description;

  Game({
    required this.title,
    required this.imagePath,
    required this.description,
  });
}
