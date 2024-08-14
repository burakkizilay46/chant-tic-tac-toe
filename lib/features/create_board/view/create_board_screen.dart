import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/core/base/view/base_view.dart';
import 'package:tic_tac_toe/features/create_board/provider/create_board_provider.dart';

class CreateBoardScreen extends StatefulWidget {
  const CreateBoardScreen({super.key});

  @override
  _CreateBoardScreenState createState() => _CreateBoardScreenState();
}

class _CreateBoardScreenState extends State<CreateBoardScreen> {
  final TextEditingController _gameNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateBoardProvider>(
        provider: CreateBoardProvider(),
        onProviderReady: (CreateBoardProvider provider) {},
        onPageBuilder: (CreateBoardProvider provider) => Scaffold(
              appBar: AppBar(
                title: const Text('Create a New Game'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: _gameNameController,
                      decoration: InputDecoration(
                        labelText: 'Game Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    Text(
                      'Select Board Color',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildColorPicker(Colors.blue),
                        _buildColorPicker(Colors.red),
                        _buildColorPicker(Colors.green),
                        _buildColorPicker(Colors.yellow),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => _createGame(provider),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 12.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'Create Game',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget _buildColorPicker(Color color) {
    return Consumer<CreateBoardProvider>(builder: (context, provider, child) {
      return GestureDetector(
        onTap: () {
          provider.setColor(color);
        },
        child: CircleAvatar(
          backgroundColor: color,
          radius: 24,
          child: provider.selectedColor == color ? const Icon(Icons.check, color: Colors.white) : null,
        ),
      );
    });
  }

  void _createGame(CreateBoardProvider provider) {
    String gameName = _gameNameController.text;

    if (gameName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in the game name')),
      );
      return;
    }

    final boardSettings = {'gameName': gameName, 'boardColor': provider.selectedColor.value};

    provider.createBoard(boardSettings, []);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Game board created successfully!')),
    );
  }
}
