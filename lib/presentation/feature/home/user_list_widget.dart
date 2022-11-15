import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/user.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/user_item.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({Key? key, required this.users}) : super(key: key);

  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return GroupedListView<User, String>(
      shrinkWrap: true,
      elements: users,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      groupBy: (User user) => user.status.toUpperCase(),
      groupSeparatorBuilder: (value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          value.toUpperCase(),
          style: AppTextStyles.headline2,
        ),
      ),
      separator: const SizedBox(height: 12),
      itemBuilder: (context, User user) {
        return UserCard(
          userDetails: user,
        );
      },
    );
  }
}
