class IndexPagination {
  final int _index;
  final int _page;
  final int _size;

  int get index => _index;

  int get page => _page;

  int get size => _size;

  IndexPagination({
    int? index,
    int? page,
    int? size,
  })  : _index = index ?? -1,
        _page = page ?? -1,
        _size = size ?? 10;

  IndexPagination copyWith({
    int? index,
    int? page,
    int? size,
  }) {
    return IndexPagination(
      index: index ?? this.index,
      page: page ?? this.page,
      size: size ?? this.size,
    );
  }

  factory IndexPagination.initial() {
    return IndexPagination(
      index: -1,
      page: -1,
      size: 10,
    );
  }

  factory IndexPagination.fromJson(Map<String, dynamic> json) {
    return IndexPagination(
      index: json['index'],
      page: json['page'],
      size: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'page': page,
      'limit': size,
    };
  }
}
