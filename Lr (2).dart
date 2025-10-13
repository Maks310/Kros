import 'dart:math';

void main() {
  double x = 1.23 * 11;
  double y = 4.6 * 11;
  double z = 36.6 / 11;

  Function ft = outer(x, y, z);

  for (int i = 0; i < 10; i++) {
    ft();
  }
}

Function outer(double x, double y, double z) {
  double b(double x, double y, double z) {
    return (1 + pow(cos(y - 2 * pow(x, 3)), 2)) /
               (2 + pow(x.abs(), 1.5) *
                    pow(sin(pow(z.abs(), 0.2)), 2)) +
           pow(log((z - y).abs()), 2);
  }

  return () {
    double a = pow(y, 2) +
        (z + pow(sin(pow((y + b(x, y, z)).abs(), 1.3)), 2)) /
            (pow(z, 2) +
                (pow(x, 2) / (y + pow(x, 3) / 3))) -
        log(x.abs()).abs();

    print("x=$x y=$y z=$z a=$a");
    x++;
  };
}