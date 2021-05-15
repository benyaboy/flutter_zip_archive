extension RemoveMapNullValues on Map {
  void removeNullValues() {
    this.removeWhere((_, value) => value == null);
  }
}