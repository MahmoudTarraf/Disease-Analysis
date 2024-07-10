class SelectableColumn {
  final String name;
  bool isSelected = false;

  SelectableColumn(this.name);

  void toggleSelection() => isSelected = !isSelected;
}
