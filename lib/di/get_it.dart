import 'package:food/data/database/database.dart';
// import 'package:food/data/database/database_manager.dart';
import 'package:get_it/get_it.dart';

// final getItInstance = GetIt.I;

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton(openConnection());
}
// Future init() async {
//   /* Objek factory maksudnya adalah dimana objek tersebut akan selalu terbuat
//   ketika kita memanggilnya atau hasil instance-nya itu berbeda. */
//   /* Objek singleton adalah objek yang mana ketika kita buat objek tersebut
//   sekali saja maka, ketika objek tersebut dipanggil dari class manapun akan tetap menghasilkan satu objek yang sama.*/
//   // getItInstance.registerLazySingleton<Client>(() => Client());
//   getItInstance.registerSingleton(AppDatabase());
// }
