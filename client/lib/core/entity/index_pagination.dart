class IndexPagination {
  int _page;
  final int _size;
  final int _index;

  int get page => _page;

  int get size => _size;

  int get index => _index;

  IndexPagination({
    int? page,
    int? limit,
    int? index,
  })  : _page = page ?? -1,
        _size = limit ?? 10,
        _index = index ?? 1;

  IndexPagination copyWith({
    int? page,
    int? size,
    int? index,
  }) {
    return IndexPagination(
      page: page ?? this.page,
      limit: size ?? this.size,
      index: index ?? this.index,
    );
  }

  factory IndexPagination.fromJson(Map<String, dynamic> json) {
    return IndexPagination(
      page: json['page'],
      limit: json['limit'],
      index: json['index'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': size,
      'index': index,
    };
  }
}
