class Reception {
  String day;
  int visitors;
  String comment;

  Reception(this.day, this.visitors, this.comment);
}

// Generic-клас (може зберігати будь-який тип, у нашому випадку Reception)
class ReceptionCollection<T> {
  Set<T> items = {};

  void add(T item) => items.add(item);

  // Generic-метод 1: пошук мінімального елемента за умовою
  T? minBy<R extends Comparable>(R Function(T) selector) {
    if (items.isEmpty) return null;
    return items.reduce(
        (a, b) => selector(a).compareTo(selector(b)) <= 0 ? a : b);
  }

  // Generic-метод 2: пошук максимального елемента за умовою
  T? maxBy<R extends Comparable>(R Function(T) selector) {
    if (items.isEmpty) return null;
    return items.reduce(
        (a, b) => selector(a).compareTo(selector(b)) >= 0 ? a : b);
  }

  // Generic-метод 3: середнє значення за умовою
  double averageBy(num Function(T) selector) {
    if (items.isEmpty) return 0;
    return items.map(selector).reduce((a, b) => a + b) / items.length;
  }
}

class Doctor {
  String surname;
  int experience;
  ReceptionCollection<Reception> receptions =
      ReceptionCollection<Reception>();

  Doctor(this.surname, this.experience);

  // методи, що використовують generic-клас
  double getAverageVisitors() =>
      receptions.averageBy((r) => r.visitors);

  Reception? getReceptionWithMinVisitors() =>
      receptions.minBy((r) => r.visitors);

  Reception? getReceptionWithLongestComment() =>
      receptions.maxBy((r) => r.comment.length);
}

// --- Функції, які повертають Future ---

// 1. Future.value (результат готовий одразу)
Future<T?> getMinReceptionAsync<T, R extends Comparable>(
    ReceptionCollection<T> collection,
    R Function(T) selector) {
  return Future.value(collection.minBy(selector));
}

// 2. Future(() { ... }) (виконання у майбутньому)
Future<T?> getMaxReceptionAsync<T, R extends Comparable>(
    ReceptionCollection<T> collection,
    R Function(T) selector) {
  return Future(() => collection.maxBy(selector));
}

// 3. async/await (теж з Future)
Future<double> getAverageVisitorsAsync(
    ReceptionCollection<Reception> collection) async {
  return Future(() => collection.averageBy((r) => r.visitors));
}

// --- Асинхронна функція, яка викликає всі по черзі ---
Future<void> processDoctorData(Doctor doc) async {
  try {
    var min = await getMinReceptionAsync(doc.receptions, (r) => r.visitors);
    print("Прийом з мінімальною кількістю: ${min?.day}, ${min?.visitors}");

    var max = await getMaxReceptionAsync(doc.receptions, (r) => r.comment.length);
    print("Прийом з найдовшим коментарем: ${max?.day}, ${max?.comment}");

    var avg = await getAverageVisitorsAsync(doc.receptions);
    print("Середня кількість відвідувачів (асинхронно): $avg");
  } catch (e) {
    print("Помилка при обробці даних: $e");
  }
}

// --- main ---
void main() async {
  var doc = Doctor("Іваненко", 15);

  doc.receptions.add(
      Reception("Понеділок", 10, "Короткий коментар"));
  doc.receptions.add(
      Reception("Вівторок", 8, "Середній коментар"));
  doc.receptions.add(
      Reception("Середа", 5, "Дуже довгий коментар про прийом пацієнтів"));

  print("Лікар: ${doc.surname}, Стаж: ${doc.experience} років");

  // Виклик асинхронної обробки
  await processDoctorData(doc);
}
