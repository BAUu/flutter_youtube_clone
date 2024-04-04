

import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';



@freezed
class Menu with _$Menu {
  const factory Menu({
    required String title,
    required String subtitle,
    required String thumbnailUrl,
    required String profile,
  }) = _Menu;

}