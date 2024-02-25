import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivina el Número',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GuessNumberForm(),
    );
  }
}

class GuessNumberForm extends StatefulWidget {
  @override
  _GuessNumberFormState createState() => _GuessNumberFormState();
}

class _GuessNumberFormState extends State<GuessNumberForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  int _secretNumber = 0;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _generateSecretNumber();
  }

  void _generateSecretNumber() {
    _secretNumber = 1 + DateTime.now().microsecondsSinceEpoch % 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivina el Número'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Introduce un número del 1 al 100',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce un número';
                  }
                  int? number = int.tryParse(value);
                  if (number == null || number < 1 || number > 100) {
                    return 'Introduce un número válido del 1 al 100';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int guessedNumber = int.parse(_numberController.text);
                    if (guessedNumber < _secretNumber) {
                      setState(() {
                        _message = 'El número es mayor';
                      });
                    } else if (guessedNumber > _secretNumber) {
                      setState(() {
                        _message = 'El número es menor';
                      });
                    } else {
                      setState(() {
                        _message =
                            '¡Felicidades! Has adivinado el número $_secretNumber';
                      });
                      _generateSecretNumber();
                      _numberController.clear();
                    }
                  }
                },
                child: Text('Comprobar'),
              ),
              SizedBox(height: 16),
              Text(
                _message,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}
