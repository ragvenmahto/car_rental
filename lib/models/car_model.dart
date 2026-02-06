class Car {
  final String id;
  final String name;
  final String image;
  final int pricePerDay;
  final double rating;
  final int seats;
  final String brand;
  final String fuelType;
  final String transmission;
  final String location;
  final bool available;

  Car({
    required this.id,
    required this.name,
    required this.image,
    required this.pricePerDay,
    required this.rating,
    required this.seats,
    required this.brand,
    required this.fuelType,
    required this.transmission,
    required this.location,
    required this.available,

  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      pricePerDay: json['pricePerDay'],
      rating: (json['rating'] as num).toDouble(),
      seats: json['seats'],
      brand: json['brand'],
      fuelType: json['fuelType'],
      transmission: json['transmission'],
      location: json['location'],
      available: json['available'],
    );
  }
}
