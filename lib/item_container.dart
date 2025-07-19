import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemContainer extends StatelessWidget {

  final Widget child;
  final String code;
  const ItemContainer({
    required this.child,
    required this.code,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          child,
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[400]!, width: 1),
                    ),
                    child: SelectableText(
                      code,
                      style: const TextStyle(fontFamily: 'Courier', fontSize: 12),
                    ),
                  )
              ),
              const SizedBox(width: 10),
              IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.copy, size: 16,),
                tooltip: 'Copy to clipboard',
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: code));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copied to clipboard')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
