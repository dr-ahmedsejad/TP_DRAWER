import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentHomeScreen(),
    );
  }
}

class StudentHomeScreen extends StatefulWidget {
  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  int _selectedTabIndex = 0;
  // Liste de cours (à titre d'exemple)
  List<List<String>> courses = [
    ['Framework basé sur Python', 'Mohamedou Cheikh Tourad'],
    ['ERP', 'Mohamed Mahmoud El Benany'],
    ['Méthodes Agiles', 'Fatimetou Med Saleck'],
    ['Sécurité des SI', 'Ahmed SEJAD'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord étudiant'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    // Placeholder image for the student profile picture
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nom de l\'étudiant',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Université de Nouakchott',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Mes cours'),
              onTap: () {
                // Ajoutez le code pour naviguer vers l'écran des cours
                // Navigator.pushNamed(context, '/cours');
                Navigator.pop(context); // Ferme le Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Notes'),
              onTap: () {
                // Ajoutez le code pour naviguer vers l'écran des notes
                // Navigator.pushNamed(context, '/notes');
                Navigator.pop(context); // Ferme le Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {
                // Ajoutez le code pour naviguer vers l'écran des paramètres
                // Navigator.pushNamed(context, '/parametres');
                Navigator.pop(context); // Ferme le Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
              onTap: () {
                // Ajoutez le code pour naviguer vers l'écran des paramètres
                // Navigator.pushNamed(context, '/parametres');
                Navigator.pop(context); // Ferme le Drawer
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Ajout de la nouvelle section pour les cours
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Mes Cours',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      courses[index][0],
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Met le texte en gras
                      ),
                    ),
                    // Ajoutez d'autres informations sur le cours si nécessaire
                    subtitle: Text('Professeur: ${courses[index][1]}'),
                    // trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Ajoutez le code pour naviguer vers les détails du cours
                      // Navigator.pushNamed(context, '/detailsCours', arguments: courses[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendrier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
      // Ajoutez le code pour changer l'écran en fonction de l'onglet sélectionné
      // par exemple, utiliser Navigator.pushNamed ou un autre moyen de navigation
    });
  }
}
