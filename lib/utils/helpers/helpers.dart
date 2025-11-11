class Helper {
  Helper._();

  static List<T> removeDuplicates<T>(List<T> gList) {
    Set<T> gSet = {};
    for (var x in gList) {
      gSet.add(x);
    }
    return gSet.toList();
  }
}
