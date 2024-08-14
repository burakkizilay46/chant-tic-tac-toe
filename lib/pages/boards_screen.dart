import 'package:flutter/material.dart';

class BoardsScreen extends StatelessWidget {
  const BoardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Yeni oyun eklemek için buraya tıklama işlevini ekleyin.
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: const BoardsListView(),
    );
  }
}

class BoardsListView extends StatelessWidget {
  const BoardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: 10, // Örnek olarak 10 öğe listeleniyor.
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: BoardCard(index: index),
        );
      },
    );
  }
}

class BoardCard extends StatelessWidget {
  final int index;

  const BoardCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.only(top: 8),
        child: Center(
          child: Text(
            'Board ${index + 1}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
