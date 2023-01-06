import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainScreenIndexProvider = StateProvider((ref) {
  int index = 0;
  return index;
});
