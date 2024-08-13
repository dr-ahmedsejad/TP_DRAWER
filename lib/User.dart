import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulaire d\'inscrption',
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final TextEditingController _matriculeController = TextEditingController();
  final TextEditingController _prenomNomController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();

  String? _selectedGenre;
  String? _selectedDepartement;

  final List<String> _departements = [
    'MPI',
    'DA2I',
    'MIAGE',
    'MI',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire de Préinscription'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Image.asset("assets/images/user.png",height: 100,width: 100,),
                SizedBox(height: 10),
                TextFormField(
                  controller: _matriculeController,
                  decoration: InputDecoration(
                    labelText: 'Matricule',
                    prefixIcon: Icon(Icons.format_list_numbered),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Veuillez entrer le matricule';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _prenomNomController,
                  decoration: InputDecoration(
                    labelText: 'Prénom et Nom',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Veuillez entrer le prénom et le nom';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Genre : "),
                    Radio(
                      value: 'homme',
                      groupValue: _selectedGenre,
                      onChanged: (value) {
                        setState(() {
                          _selectedGenre = value;
                        });
                      },
                    ),
                    Text('Homme'),
                    Radio(
                      value: 'femme',
                      groupValue: _selectedGenre,
                      onChanged: (value) {
                        setState(() {
                          _selectedGenre = value;
                        });
                      },
                    ),
                    Text('Femme'),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _telephoneController,
                  decoration: InputDecoration(
                    labelText: 'Numéro de téléphone',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Veuillez entrer le numéro de téléphone';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value?.isEmpty ?? true || !value!.contains('@')) {
                      return 'Veuillez entrer une adresse e-mail valide';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _motDePasseController,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true || value!.length < 8) {
                      return 'Le mot de passe doit contenir au moins 8 caractères';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  value: _selectedDepartement,
                  onChanged: (value) {
                    setState(() {
                      _selectedDepartement = value.toString();
                    });
                  },
                  items: _departements.map((departement) {
                    return DropdownMenuItem(
                      value: departement,
                      child: Text(departement),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Filière',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner un département';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Process the data
                            // You can access the values using _nniController.text, _matriculeController.text, etc.
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Green color for validation
                        ),
                        child: Text('Valider',style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          //_resetFields();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Red color for cancel

                        ),
                        child: Text('Annuler',style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
