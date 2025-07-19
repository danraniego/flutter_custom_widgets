import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {

    final String? title;
    final List<Widget> children;
    const ItemRow({
        super.key,
        this.title,
        required this.children
    });

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                if (title != null) const SizedBox(height: 10),
                if (title != null) Text(title ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                    )
                ),
                if (title != null) const SizedBox(height: 20),
                Row(
                    children: [
                        for (var child in children)
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: child
                                )
                            )
                    ]
                ),
                const SizedBox(height: 50),
                const Divider(height: 1, color: Colors.black12),
                const SizedBox(height: 50)
            ]
        );
    }
}
