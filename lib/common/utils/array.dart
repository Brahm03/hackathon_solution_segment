extension ListExt<T> on List<T> {
  Iterable<R> mapIndexed<R>(R Function(T element, int index) convert) sync* {
    var index = 0;
    for (var element in this) {
      yield convert(element, index++);
    }
  }

  Map<K, V> toMap<K, V>(K Function(T) key, V Function(T) value) {
    var curr = <K, V>{};
    forEach((element) {
      curr[key(element)] = value(element);
    });
    return curr;
  }
}

extension ListIntExt on List<int> {
  int sum() {
    var res = 0;
    forEach((element) {
      res += element;
    });
    return res;
  }

  int get max {
    var m = 0;
    forEach((element) {
      if (element > m) m = element;
    });
    return m;
  }
}

extension Iterables<E> on List<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension IterablesStr on List<String> {
  String get toStringList => join(",");
}
