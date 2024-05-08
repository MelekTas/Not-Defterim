import 'package:flutter/material.dart';

void main() {
  runApp(const Deneme());
}

class Deneme extends StatelessWidget {
  const Deneme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Defterim',
      theme: ThemeData(
        primaryColor: Colors.purple[200], 
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(color:  Color.fromARGB(255, 74, 17, 36), fontSize: 24, fontWeight: FontWeight.bold), // Yazı rengi pembe, büyük ve kalın
        ),
      ),
      home: const WelcomeScreen(), 
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HOŞGELDİNİZ',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.purple), 
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NoteListScreen()),
                );
              },
              child: const Text('Devam Et'),
            ),
          ],
        ),
      ),
    );
  }
}

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  
  // ignore: library_private_types_in_public_api
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<String> notes = [];
  final TextEditingController _textController = TextEditingController();
  String selectedNote = '';
  int selectedNoteIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NOT DEFTERİM',
          style: TextStyle(color: Color.fromARGB(255, 74, 17, 36), fontSize: 24, fontWeight: FontWeight.bold), // Yazı rengi
        ),
        centerTitle: true, 
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(notes[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              selectedNote = notes[index];
                              _textController.text = selectedNote;
                              selectedNoteIndex = index;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              notes.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Not Ekle',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (selectedNote.isNotEmpty) {
                        notes[selectedNoteIndex] = _textController.text;
                        selectedNote = '';
                        selectedNoteIndex = -1;
                      } else {
                        notes.add(_textController.text);
                      }
                      _textController.clear();
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
