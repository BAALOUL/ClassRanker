class Review {
  final String avatarUrl;
  final double rating;
  final String comment;
  final String date;

  Review({
    required this.avatarUrl,
    required this.rating,
    required this.comment,
    required this.date,
  });
}

List<Review> reviewList = [
  Review(
    avatarUrl: 'assets/images/m1.jpg',
    rating: 4.5,
    comment:
        'It is true that he does not smile much, but he is a very skilled worker. More than that, he is honest and does not steal. He found my bag of money and returned it to me in all honesty..',
    date: 'May 12, 2023',
  ),
  Review(
    avatarUrl: 'assets/images/m2.jpg',
    rating: 4.0,
    comment: 'I liked his job, He is great.',
    date: 'May 10, 2023',
  ),
  Review(
    avatarUrl: 'assets/images/m3.jpg',
    rating: 5.0,
    comment:
        'Mashallah, he is a polite worker and masters his work wonderfully, and I liked his work',
    date: 'May 8, 2023',
  ),
];
