part of '../../custom_dropdown.dart';

class _ItemsList extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> items;
  final bool excludeSelected;
  final String headerText;
  final ValueSetter<String> onItemSelect;
  final EdgeInsets padding;
  final TextStyle? itemTextStyle;
  final _ListItemBuilder listItemBuilder;

  const _ItemsList({
    Key? key,
    required this.scrollController,
    required this.items,
    required this.excludeSelected,
    required this.headerText,
    required this.onItemSelect,
    required this.listItemBuilder,
    required this.padding,
    this.itemTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        padding: padding,
        itemCount: items.length,
        itemBuilder: (_, index) {
          // final selected = !excludeSelected && headerText == items[index];
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.grey[200],
            onTap: () => onItemSelect(items[index]),
            child: Container(
                // color: selected ? Colors.grey[100] : Colors.transparent,
                padding: _listItemPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    listItemBuilder(context, items[index]),
                    const SizedBox(
                      height: 7,
                    ),
                    const Divider(height: 1.0, color: Color(0xF1F1F1F1)),
                  ],
                ) /* listItemBuilder(context, items[index]), */
                ),
          );
        },
      ),
    );
  }
}
