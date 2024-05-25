class Pagination {
  int _page;
  final int _size;

  int get page => _page;

  int get size => _size;

  Pagination({
    required int page,
    required int size,
  })  : _page = page,
        _size = size;

  factory Pagination.initial() {
    return Pagination(
      page: -1,
      size: 10,
    );
  }

  void nextPage() {
    _page++;
  }
}
