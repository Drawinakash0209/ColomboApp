class diary {
  final String id;
  final String date;
  final String place;
  final String experience;
  final String imageUrl;
  final datePublished;

  const diary({
    required this.id,
    required this.date,
    required this.place,
    required this.experience,
    required this.imageUrl,
    required this.datePublished,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "place": place,
        "experience": experience,
        "imageUrl": imageUrl,
        "datePublished": datePublished,
      };
}
