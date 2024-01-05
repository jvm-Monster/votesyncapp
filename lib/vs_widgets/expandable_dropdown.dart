import 'package:flutter/material.dart';

class ExpandableDropdown extends StatefulWidget {
  const ExpandableDropdown({super.key});

  @override
  State<ExpandableDropdown> createState() => _ExpandableDropdownState();
}

class _ExpandableDropdownState extends State<ExpandableDropdown> {
  String selectedValue = 'Option 1';

  List<Item> items = [
    Item('Option 1'),

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Dropdown Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: const EdgeInsets.all(0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              items[index].isExpanded = !isExpanded;
            });
          },
          children: items.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.value),
                );
              },
              body: Container(
                padding: const EdgeInsets.all(15.0),
                child: Text('Additional information for ${item.value}'),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class Item {
  Item(this.value, {this.isExpanded = false});

  String value;
  bool isExpanded;
}