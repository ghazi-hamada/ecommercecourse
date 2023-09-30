import 'package:flutter/material.dart';

class CustumAppbar extends StatelessWidget {
  final String titleAppBar;
  final void Function() onTapIconNoti;
  final void Function() onTapIconFav;
  const CustumAppbar({
    super.key,
    required this.titleAppBar,
    required this.onTapIconNoti,
    required this.onTapIconFav,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 20, top: 20),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: titleAppBar,
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10, top: 20),
          child: IconButton(
              icon: const Icon(Icons.notifications_active_outlined),
              color: Colors.grey[700],
              onPressed: onTapIconNoti),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10, top: 20),
          child: IconButton(
              icon: const Icon(Icons.favorite_border_outlined),
              color: Colors.grey[700],
              onPressed: onTapIconFav),
        ),
      ],
    );
  }
}
