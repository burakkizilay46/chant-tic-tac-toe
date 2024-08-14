import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/core/base/view/base_view.dart';
import 'package:tic_tac_toe/features/board_list/provider/board_list_provider.dart';

class BoardsScreen extends StatelessWidget {
  const BoardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        provider: BoardListProvider(),
        onProviderReady: (BoardListProvider provider) {
          provider.setContext(context);
          provider.init();
        },
        onPageBuilder: (BoardListProvider provider) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () => provider.navigateToCreateBoardPage(),
                child: const Icon(Icons.add),
              ),
              appBar: AppBar(
                title: const Text('Tic Tac Toe'),
              ),
              body: Consumer<BoardListProvider>(builder: (context, value, child) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  itemCount: provider.boards.length, // Örnek olarak 10 öğe listeleniyor.
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                      child: BoardCard(
                        index: index,
                        provider: provider,
                      ),
                    );
                  },
                );
              }),
            ));
  }
}

class BoardCard extends StatelessWidget {
  final BoardListProvider provider;
  final int index;

  const BoardCard({super.key, required this.index, required this.provider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => provider.navigateToGameBoard(),
      child: SizedBox(
        height: 64,
        child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.only(top: 8),
          child: Center(
            child: Text(
              provider.boards[index]['settings']['gameName'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
