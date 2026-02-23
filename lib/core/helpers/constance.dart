bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String isDarkTheme = 'isDarkTheme';
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

const String tableCartProduct = 'cart_product';
const String columnTitle = 'title';
const String columnPrice = 'price';
const String columnImages = 'images';
const String columnQuantity = 'quantity';
