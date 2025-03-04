import 'package:tugas_mobile/app/models/vendors.dart';
import 'package:vania/vania.dart';

class VendorsController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final pemasuk = request.input();

      await Vendors().query().insert(pemasuk);

      return Response.json({
        "message": "proses penjualan berhasil",
        "data": pemasuk,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "server tidak berfungsi, silahkan coba kembali",
        "error": e.toString()
      }, 500);
    }
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(Request request) async {
    try {
      final pemasuk = await Vendors().query().get();

      return Response.json({
        "message": "perdagagan",
        "data": pemasuk,
      }, 201);
    } catch (e) {
      return Response.json(
          {"message": "proses gagal, pliss try again", "error": e.toString()},
          500);
    }
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    try {
      final body = await request.input();
      final name = body['vend_name'];
      final address = body['vend_address'];
      final kota = body['vend_kota'];
      final state = body['vend_state'];
      final zip = body['vend_zip'];
      final country = body['vend_country'];

      final result = await Vendors().query().where('vend_id', '=', id).update({
        "vend_name": name,
        "vend_address": address,
        "vend_kota": kota,
        "vend_state": state,
        "vend_zip": zip,
        "vend_country": country
      });

      if (result > 0) {
        return Response.json(
          {
            'message': 'proses update data berhasil',
            'updated_id': id,
          },
          200,
        );
      } else {
        return Response.json(
          {'message': 'proses tidak berhasil, plis try again'},
          404,
        );
      }
    } catch (e) {
      return Response.json({
        'message': 'terjadi kesalahan saat proses di lakukan',
        'error': e.toString(),
      }, 500);
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      await Vendors().query().where('vend_id', '=', id).delete();

      return Response.json({'message': 'proses delete data berhasil'});
    } catch (e) {
      return Response.json({
        'message': 'data tidak berhasil di hapus, pliss try again',
        'error': e.toString()
      });
    }
  }
}

final VendorsController vendorsController = VendorsController();
