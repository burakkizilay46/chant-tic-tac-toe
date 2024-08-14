import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/base/view/base_view.dart';
import 'package:tic_tac_toe/features/user_create/provider/user_create.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return BaseView(
        provider: UserCreateProvider(),
        onProviderReady: (UserCreateProvider provider) {
          provider.setContext(context);
          provider.init();
        },
        onPageBuilder: (UserCreateProvider provider) => Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          labelText: 'Enter your username',
                          hintText: 'John Doe',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ElevatedButton(
                            onPressed: () async {
                              provider.createUser(_controller.text);
                              _controller.clear();
                            },
                            child: const Text('Next')),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
