import 'package:tugas_mobile/app/models/productnotes.dart';
import 'package:vania/vania.dart';

class ProductnotesController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final noteproduk = request.input();
      await Productnotes().query().insert(noteproduk);

      return Response.json({
        "message": "produk is the best",
        "data": noteproduk,
      }, 201);
    } catch (e) {
      return Response.json(
          {"message": "GAGAL, PLIS TRY AGAIN BOS", "error": e.toString()}, 500);
    }
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(Request request) async {
    try {
      final noteproduk = await Productnotes().query().get();

      return Response.json({
        "message": "produk is good",
        "data": noteproduk,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "tidak berhasil menampilkan data, pliss try again",
        "error": e.toString()
      }, 500);
    }
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    try {
      final body = await request.input();
      final pid = body['prod_id'];
      final notedate = body['note_date'];
      final notetext = body['note_text'];

      final result = await Productnotes()
          .query()
          .where('note_id', '=', id)
          .update(
              {"prod_id": pid, "note_date": notedate, "note_text": notetext});

      if (result > 0) {
        return Response.json(
          {
            'message': 'nice, data berhasil di update',
            'updated_id': id,
          },
          200,
        );
      } else {
        return Response.json(
          {'message': 'update data tidak berhasil'},
          404,
        );
      }
    } catch (e) {
      return Response.json({
        'message': 'terjadi kesalahan pada update data',
        'error': e.toString(),
      }, 500);
    }
  }

  Future<Response> destroy(int id) async {
    try {
      await Productnotes().query().where('prod_id', '=', id).delete();

      return Response.json({'message': 'nice, data berhasil di hapus'});
    } catch (e) {
      return Response.json(
          {'message': 'gagal bro, pliss try again', 'error': e.toString()});
    }
  }
}

final ProductnotesController productnotesController = ProductnotesController();
