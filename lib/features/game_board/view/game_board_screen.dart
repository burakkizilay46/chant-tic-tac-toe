import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tic_tac_toe/core/base/view/base_view.dart';
import 'package:tic_tac_toe/features/game_board/provider/game_provider.dart';

class GameBoardScreen extends StatefulWidget {
  final Map<String, dynamic> selectedBoard;
  const GameBoardScreen({super.key, required this.selectedBoard});

  @override
  _GameBoardScreenState createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  bool _isXTurn = true;
  String _statusMessage = 'X\'s Turn';

  @override
  Widget build(BuildContext context) {
    return BaseView(
        provider: GameProvider(),
        onProviderReady: (GameProvider provider) {
          provider.setContext(context);
          provider.init();
          provider.initBoard(widget.selectedBoard);
        },
        onPageBuilder: (GameProvider provider) => Scaffold(
              backgroundColor: Color(provider.board['settings']['boardColor']),
              appBar: AppBar(
                title: Text(provider.board['settings']['gameName']),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                        visible: !provider.haveOPlayer,
                        child: ElevatedButton(onPressed: () => provider.joinGame(), child: const Text('Join Game'))),
                    Text(
                      _statusMessage,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildBoard(provider),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ));
  }

  Widget _buildBoard(GameProvider provider) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9,
        itemBuilder: (context, index) {
          return _buildTile(index, provider);
        },
      ),
    );
  }

  Widget _buildTile(int index, GameProvider provider) {
    return GestureDetector(
      onTap: () {
        _onTileTapped(index, provider);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Center(
          child: Text(
            provider.board['board'][index],
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _onTileTapped(int index, GameProvider provider) {
    if (provider.board['board'][index].isEmpty) {
      setState(() {
        provider.tapTile(index, _isXTurn);
        _isXTurn = !_isXTurn;
        _statusMessage = _isXTurn ? 'X\'s Turn' : 'O\'s Turn';
      });
      _checkWinner(provider);
    }
  }

  void _checkWinner(GameProvider provider) {
    const List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
  }
}
