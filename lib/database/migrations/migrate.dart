import 'dart:io';
import 'package:tugas_mobile/database/migrations/create_personal_access_tokens_table.dart';
import 'package:vania/vania.dart';
import 'create_users_table.dart';
// import 'D:\ALL FILE\KULIAH\SEM7\MOBILE\tugas_mobile/lib/database/migrations/create_personal_access_tokens_table.dartcreate_personal_access_tokens_table.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
    await CreatePersonalAccessTokensTable().up();
    await CreateUserTable().up();
  }

  dropTables() async {
    await CreateUserTable().down();
  }
}
