import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/historiasdestacadas.dart';

class PerfilBody extends StatefulWidget {
  @override
  _PerfilBodyState createState() => _PerfilBodyState();
}

class _PerfilBodyState extends State<PerfilBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  static const IconData border_all_sharp =
      IconData(0xe7f4, fontFamily: 'MaterialIcons');

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
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
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
            Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Row(
                  children: List.generate(
                    historias.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: historias[index],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey.shade400),
              ),
              child: TabBar(
                labelColor: Colors.black,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.black),
                ),
                tabs: [
                  Tab(icon: Icon(Icons.border_all_sharp)),
                  Tab(icon: Icon(Icons.list)),
                  Tab(icon: Icon(Icons.account_box_outlined)),
                  Tab(icon: Icon(Icons.bookmark_border_rounded)),
                ],
              ),
            ),

            // Contenido de las pestañas (TabBarView).
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Contenido de la primera pestaña
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
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
                  // Contenido de la segunda pestaña
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
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

                  // Contenido de la tercera pestaña
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
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

                  // Contenido de la cuarta pestaña
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
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
