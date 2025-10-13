// Інтерфейс "Будівля"
abstract class Building {
  String getName();
  String getAddress();
  int getYearBuilt();
  void showInfo();
}

// Абстрактний клас "Громадська будівля"
abstract class PublicBuilding implements Building {
  String name;
  String address;
  int yearBuilt;

  PublicBuilding(this.name, this.address, this.yearBuilt);

  @override
  String getName() => name;

  @override
  String getAddress() => address;

  @override
  int getYearBuilt() => yearBuilt;

  // Абстрактний метод (буде реалізований у нащадках)
  void showInfo();
}

// Клас "Театр"
class Theatre extends PublicBuilding {
  int seats;          // кількість місць
  String repertoire;  // репертуар

  Theatre(String name, String address, int yearBuilt,
      this.seats, this.repertoire)
      : super(name, address, yearBuilt);

  @override
  void showInfo() {
    print("Театр: $name");
    print("Адреса: $address");
    print("Рік побудови: $yearBuilt");
    print("Кількість місць: $seats");
    print("Репертуар: $repertoire");
    print("------------------------------");
  }
}

void main() {
  List<Theatre> theatres = [
    Theatre("Національний театр", "м. Київ, вул. Хрещатик, 1", 1901, 1200,
        "Драми, опери, балети"),
    Theatre("Обласний драмтеатр", "м. Львів, пл. Ринок, 15", 1950, 800,
        "Сучасні постановки"),
  ];

  for (var t in theatres) {
    t.showInfo();
  }
}
