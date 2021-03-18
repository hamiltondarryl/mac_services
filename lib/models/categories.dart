class CategorieModel {

    String id;
    String libelle;

    CategorieModel({
        this.id,
        this.libelle,
    });


    factory CategorieModel.fromJson(Map<String, dynamic> json) => CategorieModel(
        id: json["id"],
        libelle: json["libelle"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
    };
}