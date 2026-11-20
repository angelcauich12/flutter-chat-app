import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  final List<User> users = [
    User(
      online: true,
      email: "user@email.com",
      name: "Miguel Cauich",
      uid: "uid1",
    ),

    User(
      online: false,
      email: "user@email.com",
      name: "Brayan Flores",
      uid: "uid2",
    ),

    User(
      online: false,
      email: "user@email.com",
      name: "Esteban Cauich",
      uid: "uid3",
    ),
    User(
      online: true,
      email: "user@email.com",
      name: "Fernando Cauich",
      uid: "uid4",
    ),
    User(
      online: true,
      email: "user@email.com",
      name: "Jonathan Flores",
      uid: "uid5",
    ),
    User(
      online: true,
      email: "user@email.com",
      name: "Alberto Cauich",
      uid: "uid6",
    ),
    User(
      online: false,
      email: "user@email.com",
      name: "Nashea Flores",
      uid: "uid7",
    ),
    User(
      online: false,
      email: "user@email.com",
      name: "Juanito Alimaña",
      uid: "uid8",
    ),
    User(
      online: true,
      email: "user@email.com",
      name: "Pedro navajas",
      uid: "uid9",
    ),
    User(
      online: false,
      email: "user@email.com",
      name: "Alfonso Fierro",
      uid: "uid10",
    ),
  ];

  void _loadUsers() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Name"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(backgroundColor: Colors.red, radius: 6),
          ),
        ],
      ),
      body: SmartRefresher(

        header: WaterDropHeader(waterDropColor: Colors.blue.shade400, ),
        // footer: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _loadUsers,
        child: _listViewUsers(),
      ),
    );
  }

  ListView _listViewUsers() {
    return ListView.separated(
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final user = users[index];
        return _UsersListTile(user: user);
      },

      itemCount: users.length,
      separatorBuilder: (_, _) => Divider(),
    );
  }
}

class _UsersListTile extends StatelessWidget {
  const _UsersListTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(user.name.substring(0, 2).toUpperCase()),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: CircleAvatar(
        radius: 5,
        backgroundColor: user.online ? Colors.green : Colors.red,
      ),
    );
  }
}
