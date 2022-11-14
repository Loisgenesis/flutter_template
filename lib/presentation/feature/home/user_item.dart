import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/user.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.userDetails,
  }) : super(key: key);

  final User userDetails;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[900],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                userDetails.name.substring(0, 2).toUpperCase(),
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(userDetails.name,
                style:
                    AppTextStyles.body1.copyWith(color: context.colors.white)),
          ),
        ],
      ),
    );
  }
}
