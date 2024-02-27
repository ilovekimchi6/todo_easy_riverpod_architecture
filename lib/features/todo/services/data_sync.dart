import 'package:hooks_riverpod/hooks_riverpod.dart';



//Please note this service notifier class is not yet implemented.

//This is an example to show what a service can look like, but there is not strict definition, feel free to call a service what you will, however I will type my answer below!


//A service combines business logic from multiple places and gives you an output. Think reading value from two repositories, making some calculations and returning a value. This is a service.
//In our case we are syncing data from a local database to a remote database.

//PLEASE NOTE - Not all features would require a service folder. Many service related calculations would be done in the backend, however in our case we have a service because
//we are syncing data from a local database to a remote database.


//We have plans to implement this in the future!

class DataSync {
  final Ref localDB;
  final Ref remoteDB;

  DataSync({required this.localDB, required this.remoteDB});

}
