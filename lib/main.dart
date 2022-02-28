import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contador de Pessoas", 
      home: HomePage(), 
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;
  String _infoText = "Pode Entrar!";

  void _decrement() {
    setState(() {
      _count--;
    });
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }

  bool get isEmpty => _count == 0;
  bool get isFull => _count == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/restaurant.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text (
                isFull ? 'Lotado!' : 'Pode Entrar!',
                style: TextStyle(
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$_count",
                style: TextStyle(
                  color: isFull ? Colors.red : Colors.white, 
                  fontSize: 100,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: isEmpty ? null : _decrement,
                    child: const Text(
                      "Saiu",
                      style: const TextStyle(
                        fontSize: 16.0, 
                        color: Colors.black
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: isFull ? null : _increment,
                    child: const Text(
                      "Entrou",
                      style: const TextStyle(
                        fontSize: 16.0, 
                        color: Colors.black
                      ),
                    )
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
