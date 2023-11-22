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
    // creo lista de historias destacadas
    historiasdestacadas(
        text: 'historia destacada', // voy insertando la imagen de cada una
        imagen: 'assets/h1.png',
        width: 80,
        height: 80),
    historiasdestacadas(
        text: 'gatetes', imagen: 'assets/h1.png', width: 80, height: 80),
    historiasdestacadas(
        text: '2017 Euskadi', imagen: 'assets/h2.png', width: 80, height: 80),
  ];

  @override
  void initState() {
    // esto es necesario para llamar al controllador
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // esto lo cierra luego
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
            Row(
              children: historias,
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
                    padding: EdgeInsets.all(16.0),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      children: [
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
