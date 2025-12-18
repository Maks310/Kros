import 'package:flutter/material.dart';

void main() {
  runApp(const FootballApp());
}

class FootballApp extends StatelessWidget {
  const FootballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const FootballTeamsPage(),
    );
  }
}

class FootballTeamsPage extends StatefulWidget {
  const FootballTeamsPage({super.key});

  @override
  State<FootballTeamsPage> createState() => _FootballTeamsPageState();
}

class _FootballTeamsPageState extends State<FootballTeamsPage> {
  int selectedIndex = -1;

  final List<Map<String, String>> teams = [
    {
      'name': 'FC Barcelona',
      'image': 'https://upload.wikimedia.org/wikipedia/uk/thumb/4/47/FC_Barcelona_%28crest%29.svg/960px-FC_Barcelona_%28crest%29.svg.png',
      'info': 'FC Barcelona — один з найвідоміших футбольних клубів Іспанії.'
    },
    {
      'name': 'Real Madrid',
      'image': 'https://upload.wikimedia.org/wikipedia/uk/thumb/5/56/Real_Madrid_CF.svg/330px-Real_Madrid_CF.svg.png',
      'info': 'Real Madrid — клуб з Мадрида, 14-разовий чемпіон Ліги чемпіонів.'
    },
    {
      'name': 'Manchester United',
      'image': 'https://upload.wikimedia.org/wikipedia/uk/thumb/e/e1/Manchester_United_FC.png/296px-Manchester_United_FC.png',
      'info': 'Manchester United — легендарний англійський клуб з Оле-Стадіон.'
    },
    {
      'name': 'Bayern Munich',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/FC_Bayern_M%C3%BCnchen_logo_%282024%29.svg/250px-FC_Bayern_M%C3%BCnchen_logo_%282024%29.svg.png',
      'info': 'Bayern Munich — найтитулованіший клуб Німеччини.'
    },
    {
      'name': 'Juventus',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Juventus_FC_-_logo_black_%28Italy%2C_2020%29.svg/250px-Juventus_FC_-_logo_black_%28Italy%2C_2020%29.svg.png',
      'info': 'Juventus — італійський клуб з Турина, відомий своїми чорними смугами.'
    },
    {
      'name': 'Liverpool',
      'image': 'https://upload.wikimedia.org/wikipedia/uk/c/cf/FC_Liverpool_Logo.png?20200628121404',
      'info': 'Liverpool — англійський клуб, 6-разовий переможець Ліги чемпіонів.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Футбольні команди'),
      ),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          final team = teams[index];
          final isSelected = index == selectedIndex;

          return Column(
            children: [
              Card(
                color: isSelected ? Colors.blue.shade100 : null,
                child: ListTile(
                  leading: Image.network(
                    team['image']!,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(team['name']!),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.sports_soccer),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
              if (isSelected)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    team['info']!,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
