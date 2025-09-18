import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum ShowType { series, movie }

@JsonEnum()
enum SortOrder { titleAsc, titleDesc, yearAsc, yearDesc }

@JsonEnum()
enum ShowStatus { toWatch, inProgress, watched }


