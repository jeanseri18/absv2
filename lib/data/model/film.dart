

import 'dart:convert';

List<Film> filmFromJson(String str) => List<Film>.from(json.decode(str).map((x) => Film.fromJson(x)));

String filmToJson(List<Film> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Film {
    Film({
        required this.id,
        required this.titre,
        required this.idCategorie,
        required this.url,
        required this.file,
        required this.video,
        required this.langue,
        required this.dateAjout,
        required this.nbreVue,
        required this.nbreLike,
        required this.auteur,
        required this.statut,
        required this.dure,
        required this.descrFilm,
        required this.idmedia,
        required this.type,
        required this.iduser,
    });

    String id;
    String titre;
    String idCategorie;
    String url;
    String file;
    String video;
    String langue;
    DateTime dateAjout;
    String nbreVue;
    String nbreLike;
    String auteur;
    String statut;
    String dure;
    String descrFilm;
    String idmedia;
    String type;
    String iduser;

    factory Film.fromJson(Map<String, dynamic> json) => Film(
        id: json["id"],
        titre: json["titre"],
        idCategorie: json["id_categorie"],
        url: json["url"],
        file: json["file"],
        video: json["video"],
        langue: json["langue"],
        dateAjout: DateTime.parse(json["date_ajout"]),
        nbreVue: json["nbre_vue"],
        nbreLike: json["nbre_like"],
        auteur: json["auteur"],
        statut: json["statut"],
        dure: json["dure"],
        descrFilm: json["descr_film"],
        idmedia: json["idmedia"],
        type: json["type"],
        iduser: json["iduser"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titre": titre,
        "id_categorie": idCategorie,
        "url": url,
        "file": file,
        "video": video,
        "langue": langue,
        "date_ajout": "${dateAjout.year.toString().padLeft(4, '0')}-${dateAjout.month.toString().padLeft(2, '0')}-${dateAjout.day.toString().padLeft(2, '0')}",
        "nbre_vue": nbreVue,
        "nbre_like": nbreLike,
        "auteur": auteur,
        "statut": statut,
        "dure": dure,
        "descr_film": descrFilm,
        "idmedia": idmedia,
        "type": type,
        "iduser": iduser,
    };
}
