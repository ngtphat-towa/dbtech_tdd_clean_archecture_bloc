import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();

  void getUsers() {
    context.read<AuthenticationCubit>().getUsers();
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else {
          if (state is UserCreated) {
            getUsers();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   title: const Text('Home Page'),
          // ),
          body: state is GettingUsers
              ? const Center(
                  child: LoadingIndicator(message: 'Getting users'),
                )
              : state is CreatingUser
                  ? const Center(
                      child: LoadingIndicator(message: 'Creating users'),
                    )
                  : state is UserLoaded
                      ? Center(
                          child: ListView.builder(
                          itemCount: state.users.length,
                          itemBuilder: (context, index) {
                            final user = state.users[index];
                            return ListTile(
                              leading: Image.network(user.avatar),
                              title: Text(user.name),
                              subtitle: Text(user.createdAt.substring(10)),
                            );
                          },
                        ))
                      : const SizedBox.shrink(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => AddUserDialog(
                  nameController: nameController,
                ),
              );
            },
            tooltip: 'Increment',
            label: const Text('Add user'),
            icon: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
