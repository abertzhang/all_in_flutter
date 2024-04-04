abstract class Car {
  void produce();
}

class Sedan implements Car {
  @override
  void produce() {
    print('生产Sedan汽车...');
  }
}

class Suv implements Car {
  @override
  void produce() {
    print('生产Suv汽车...');
  }
}

class SportsCar implements Car {
  @override
  void produce() {
    print('生产跑车...');
  }
}

class CarFactory {
  static Car? createCar(String type) {
    if (type == 'Sedan') {
      return Sedan();
    } else if (type == 'Suv') {
      return Suv();
    } else if (type == 'SportsCar') {
      return SportsCar();
    }
    return null;
  }
}

Stream<Car?> productionLine() async* {
  while (true) {
    yield CarFactory.createCar('Sedan');
    await Future.delayed(Duration(seconds: 2));
    yield CarFactory.createCar('Suv');
    await Future.delayed(Duration(seconds: 1));
    yield CarFactory.createCar('SportsCar');
    await Future.delayed(Duration(seconds: 3));
  }
}

void consumeCars(Stream<Car?> carStream) {
  carStream.listen((car) {
    if (car == null) return;
    car.produce();
  });
}

void main() {
  final carStream = productionLine();
  consumeCars(carStream);
}
