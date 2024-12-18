// import 'package:tugas_mobile/app/models/user.dart';
import 'package:vania/vania.dart';
import 'package:tugas_mobile/app/models/customer.dart';

class Customers extends Controller {
  Future<Response> Put(Request request, int id) async {
    try {
      final body = await request.input();
      final name = body['cust_name'];
      final Address = body['cust_address'];
      final city = body['cust_city'];
      final state = body['cust_state'];
      final zip = body['cust_zip'];
      final country = body['cust_country'];
      final telp = body['cust_telp'];

      final result = await Customer().query().where('cust_id', '=', id).update({
        "cust_name": name,
        "cust_address": Address,
        "cust_city": city,
        "cust_state": state,
        "cust_zip": zip,
        "cust_country": country,
        "cust_telp": telp
      });

      if (result > 0) {
        return Response.json(
          {
            "message": "Berhasil melakukan update pada data ini",
            "update_id": id,
          },
          200, // OK
        );
      } else {
        return Response.json(
          {
            "message": "tidak berhasil melakukan update data",
          },
          404, // Not Found
        );
      }
    } catch (e) {
      return Response.json({
        "message": "terdapat error pada saat melakukan update data",
        "error": e.toString(),
      }, 500);
    }
    // return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final CustomerData = request.input();
      await Customer().query().insert(CustomerData);

      return Response.json(
          {"message": "pelanggan berhasil di tambahkan", "data": CustomerData},
          201);
    } catch (e) {
      return Response.json({
        "message": "halaman ini error, plis try again",
        "error": e.toString()
      }, 500);
    }
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(Request request) async {
    try {
      final pelanggan = await Customer().query().get();

      return Response.json({
        "message": "Data pelanggan",
        "data": pelanggan,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "data ini tidak dapat di ambil, try again",
        "error": e.toString()
      }, 500);
    }
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    return Response.json({});
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      await Customer().query().where('cust_id', '=', id).delete();

      return Response.json({'message': 'Berhasil menghapus data customer'});
    } catch (e) {
      return Response.json({
        "message": "tidak berhasil menghapus data customer",
        "error": e.toString()
      });
    }
  }
}

final Customers customers = Customers();
