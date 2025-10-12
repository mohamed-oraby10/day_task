import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/model/user_model.dart';
import 'package:day_task/screens/chat_screen.dart';
import 'package:day_task/widgets/create_group_button.dart';
import 'package:day_task/widgets/new_message_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String searchQuery = '';
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<UserModel> usersList = [];
          for (var doc in snapshot.data!.docs) {
            usersList.add(
              UserModel.fromJson(doc.id, doc.data() as Map<String, dynamic>),
            );
          }

          final filteredUsers = usersList.where((user) {
            final name = user.name.toLowerCase();
            final email = user.email.toLowerCase();
            final query = searchQuery.toLowerCase();
            return name.contains(query) || email.contains(query);
          }).toList();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: kBackgroundColor,
              elevation: 0,
              leading: IconButton(
                icon: SvgPicture.asset("assets/images/arrowleft.svg"),
                onPressed: () => Navigator.pop(context),
              ),
              title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, anim) =>
                    FadeTransition(opacity: anim, child: child),
                child: isSearching
                    ? TextField(
                        key: const ValueKey('searchField'),
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    : Center(
                        child: const Text(
                          "New Message",
                          key: ValueKey('titleText'),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
              ),
              actions: [
                IconButton(
                  icon: isSearching
                      ? const Icon(Icons.close, color: Colors.white)
                      : SvgPicture.asset("assets/images/searchnormal1.svg"),
                  onPressed: () {
                    setState(() {
                      if (isSearching) searchQuery = '';
                      isSearching = !isSearching;
                    });
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                const CreateGroupButton(),
                Expanded(
                  child: filteredUsers.isEmpty
                      ? Center(
                          child: Text(
                            isSearching && searchQuery.isNotEmpty
                                ? 'No users found'
                                : 'No users available',
                            style: TextStyle(color: kMainColor, fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredUsers.length,
                          itemBuilder: (context, index) {
                            final user = filteredUsers[index];
                            return NewMessageCategory(
                              user: user,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const ChatScreen();
                                    },
                                    settings: RouteSettings(arguments: user),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: kMainColor),
          );
        }
      },
    );
  }
}
