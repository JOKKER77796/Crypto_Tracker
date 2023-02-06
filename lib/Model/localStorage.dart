import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<bool> addFavorites(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> fav = sharedPreferences.getStringList("fav") ?? [];
    fav.add(id);
    print(fav);
    return await sharedPreferences.setStringList("fav", fav);
  }

  static Future<bool> removeFavorite(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> fav = sharedPreferences.getStringList("fav") ?? [];
    fav.remove(id);
    return await sharedPreferences.setStringList("fav", fav);
  }

  static Future<List<String>> fatchFavorites() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList("fav") ?? [];
  }
}
