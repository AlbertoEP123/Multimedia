import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/historiasdestacadas.dart';

class PerfilBody extends StatefulWidget {
  @override
  _PerfilBodyState createState() => _PerfilBodyState();
}

class _PerfilBodyState extends State<PerfilBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Nueva lista de burbujas
  List<historiasdestacadas> historias = [
    historiasdestacadas(
        text: 'historia destacada',
        imagen: 'assets/h1.png',
        width: 80,
        height: 80),
    historiasdestacadas(
        text: 'gatetes', imagen: 'assets/h1.png', width: 80, height: 80),
    historiasdestacadas(
        text: '2017 Euskadi', imagen: 'assets/h2.png', width: 80, height: 80),
    historiasdestacadas(
        text: '2017 Euskadi', imagen: 'assets/h2.png', width: 80, height: 80),
    historiasdestacadas(
        text: '2017 Euskadi', imagen: 'assets/h2.png', width: 80, height: 80),
    historiasdestacadas(
        text: '2017 Euskadi', imagen: 'assets/h2.png', width: 80, height: 80),
    historiasdestacadas(
        text: '2017 Euskadi', imagen: 'assets/h2.png', width: 80, height: 80),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Biografía
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biografía',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Editor en @Xataka. Me gusta la tecnología y escribir sobre ella, la música y las series, el cine y los videojuegos. Phone: Samsung Galaxy S7',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'twitter.com/Yubal_FM',
                    style: TextStyle(
                      color: Color.fromARGB(255, 28, 25, 210),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

// Scroll horizontal de Historias Destacadas
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: List.generate(
      historias.length,
      (index) => Padding(
        padding: const EdgeInsets.all(4.0), // Ajusta el espacio alrededor de cada historia
        child: historias[index],
      ),
    ),
  ),
),




            // TabBar para navegar entre las secciones de fotos.
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey.shade400),
              ),
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.grey.shade400,
                labelColor: Colors.black,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.black),
                ),
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.border_all_sharp,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.list,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.account_box_outlined,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.bookmark_border_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),

            // Contenido de las pestañas (TabBarView).
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Contenido de la primera pestaña (Imágenes u otra cosa)
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      mainAxisSpacing: 0, // Eliminar el margen vertical entre las fotos
                      crossAxisSpacing: 0,
                      ),
                      children: [
                        Image.asset('assets/1.png'),
                        Image.asset('assets/2.png'),
                        Image.asset('assets/3.png'),
                        Image.asset('assets/1.png'),
                        Image.asset('assets/2.png'),
                        Image.asset('assets/3.png'),
                        Image.asset('assets/1.png'),
                        Image.asset('assets/2.png'),
                        Image.asset('assets/3.png'),
                        Image.asset('assets/1.png'),
                        Image.asset('assets/2.png'),
                        Image.asset('assets/3.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}