import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/home_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin<Home> {
  @override
  void afterFirstLayout(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Satatemangent '),
        elevation: 0,
      ),
      body: Consumer<HomeProvider>(builder: (context, home, _) {
        if (home.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (home.users.isEmpty) {
          return const Center(
            child: Text('No Users Found'),
          );
        } else {
          return ListView.builder(
            itemCount: home.users.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
              home.users[index].name ?? "",
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              home.users[index].address ?? "",
              style: const TextStyle(fontSize: 16),
            ),
            ),
          );
        }
      }),
    );
  }
}
