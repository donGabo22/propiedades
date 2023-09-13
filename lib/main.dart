import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isChecked = false;
  DateTime _selectedDate = DateTime.now();

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('<===== abrele aca'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Alert Dialog'),
                      content: const Text('Este es un AlertDialog.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Mostrar Alert Dialog'),
            ),
            const Card(
              elevation: 4.0,
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Este es un Card'),
              ),
            ),
            Checkbox(
              value: _isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  _isChecked = newValue ?? false;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _showDatePicker(context);
              },
              child: const Text('Mostrar DatePicker'),
            ),
            ElevatedButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Text('Menu hAMBURGUESA Drawer'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('MENU HAMBURGUESA '),
            ),
            ListTile(
              title: const Text('DOBLE'),
              onTap: () {
                // Acción cuando se selecciona la opción 1
              },
            ),
            ListTile(
              title: const Text('SENCILLA'),
              onTap: () {
                // Acción cuando se selecciona la opción 2
              },
            ),
          ],
        ),
      ),
    );
  }
}
