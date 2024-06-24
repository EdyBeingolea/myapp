
import 'dart:convert';

List<Proveedor> proveedorFromJson(String str) => List<Proveedor>.from(json.decode(str).map((x) => Proveedor.fromJson(x)));

String proveedorToJson(List<Proveedor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Proveedor {
    final int id;
    final String nombre;
    final String apellido;
    final String direccion;
    final String celular;
    final String email;
    final Estado estado;

    Proveedor({
        required this.id,
        required this.nombre,
        required this.apellido,
        required this.direccion,
        required this.celular,
        required this.email,
        required this.estado,
    });

    factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        direccion: json["direccion"],
        celular: json["celular"],
        email: json["email"],
        estado: estadoValues.map[json["estado"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "direccion": direccion,
        "celular": celular,
        "email": email,
        "estado": estadoValues.reverse[estado],
    };
}

enum Estado {
    A
}

final estadoValues = EnumValues({
    "A": Estado.A
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
