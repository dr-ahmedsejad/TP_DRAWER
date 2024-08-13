import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulaire de Collecte d\'Informations',
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

  final TextEditingController _nniController = TextEditingController();
  final TextEditingController _matriculeController = TextEditingController();
  final TextEditingController _prenomNomController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();

  String? _selectedGenre;
  String? _selectedDepartement;
  File? _imageFile;

  final List<String> _departements = ['Maths', 'Informatique', 'Physique', 'Biologie', 'Géologie', 'Chimie'];

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire de Collecte d\'Informations'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ... (Other form fields)

                SizedBox(height: 10),
                IconButton(
                  icon: Icon(Icons.photo, size: 48), // Adjust the size here
                  onPressed: _pickImage,
                  tooltip: 'Parcourir une photo',
                ),
                SizedBox(height: 10),
                _imageFile != null
                    ? Image.file(
                  _imageFile!,
                  height: 100,
                )
                    : Container(), // Display the selected image if available

                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Process the data
                      // You can access the values using _nniController.text, _matriculeController.text, etc.
                    }
                  },
                  child: Text('Valider'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
