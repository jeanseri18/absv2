class Trending {
  final int id;
  final String name;
  final String image;
  final String type;
  final String rating;
  final String file;
  const Trending(
      {required this.id,
      required this.name,
      required this.image,
      required this.type,
      required this.rating,
      required this.file});
}

class TrendingList {
  static List<Trending> list() {
    const data = <Trending>[
      Trending(
        id: 1,
        name: 'Usluss Us',
        image: 'assets/images/trending/1.png',
        type: 'Horror',
        rating: '8',
        file: '',
      ),
    ];
    return data;
  }
}
