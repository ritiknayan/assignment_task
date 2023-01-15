import 'package:flutter/material.dart';
import 'package:testing_widgets/Screen/grid_screen.dart';

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late int m;

  late int n;

  late String alphbates;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 57, 97, 1),
        title: const Text(
          'User Input',
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      body: Center(
          child: Card(
        margin: const EdgeInsets.all(30),
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (int.tryParse(value!) == null) {
                          return 'please enter valid Number';
                        } else if ((int.parse(value) > 100) ||
                            (int.parse(value) < 0)) {
                          return 'please enter valid Number';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        hintText: 'Enter value for m',
                        hintStyle: const TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onSaved: (newValue) {
                        try {
                          m = int.parse(newValue!);
                        } catch (e) {
                          print(e);
                        }
                        print(m);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (0.04),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (int.tryParse(value!) == null) {
                          return 'please enter valid Number';
                        } else if ((int.parse(value) > 100) ||
                            (int.parse(value) < 0)) {
                          return 'please enter valid Number';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        hintText: 'Enter value for n',
                        hintStyle: const TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onSaved: (newValue) {
                        n = int.parse(newValue!);
                        print(n);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (0.04),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        _formKey.currentState!.save();
                        if (value!.length != m * n) {
                          return 'please enter valid Alphabets';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        hintText: 'Enter m*n alphabates',
                        hintStyle: const TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onSaved: (newValue) {
                        alphbates = newValue!;
                        print(alphbates);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (0.04),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.of(context).pushNamed(
                                GridScreen.nameRoute,
                                arguments: [m, n, alphbates]);
                          }
                        },
                        child: const Text('Save Data'))
                  ]),
                ))),
      )),
    );
  }
}
