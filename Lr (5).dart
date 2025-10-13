class Pryiom {
  String day;
  int visitors;
  String comment;

  Pryiom(this.day, this.visitors, this.comment);
  // гетери
  String get getDay => day;
  int get getVisitors => visitors;
  String get getComment => comment;
  // сетери
  set setDay(String d) => day = d;
  set setVisitors(int v) => visitors = v;
  set setComment(String c) => comment = c;

  @override
  String toString() => 'День: $day, Відвідувачів: $visitors, Коментар: $comment';
}
class Likar with Logger {
  String surname;
  int experience;
  Set<Pryiom> pryyomy = {};

  Likar(this.surname, this.experience);

  void addPryiom(Pryiom p) {
    pryyomy.add(p);
     log('Додано прийом: ${p.day}');
  }

  double averageVisitors() {
    if (pryyomy.isEmpty) return 0;
    var sum = pryyomy.fold<int>(0, (prev, el) => prev + el.visitors);
    return sum / pryyomy.length;
  }

  Pryiom minVisitors() {
    return pryyomy.reduce((a, b) => a.visitors < b.visitors ? a : b);
  }

  Pryiom longestComment() {
    return pryyomy.reduce((a, b) => a.comment.length > b.comment.length ? a : b);
  }

  @override
  String toString() => 'Лікар: $surname, Стаж: $experience років';
  
}
mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

void main() {
  var likar = Likar('Іваненко', 15);

  likar.addPryiom(Pryiom('Понеділок', 10, 'Звичайний прийом'));
  likar.addPryiom(Pryiom('Середа', 5, 'Дуже довгий прийом пацієнтів'));
  likar.addPryiom(Pryiom('П’ятниця', 8, 'Скорочений прийом'));

  print(likar);

  print('Середня кількість відвідувачів: ${likar.averageVisitors()}');
  print('Прийом з мінімальною кількістю відвідувачів: ${likar.minVisitors()}');
  print('Прийом з найдовшим коментарем: ${likar.longestComment()}');

}
