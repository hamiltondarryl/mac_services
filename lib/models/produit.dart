class ProduitModel {
  ProduitModel({
    this.id,
    this.libelle,
    this.description,
    this.prixUn,
    this.pvente,
    this.quantite,
    this.categorie,
    this.image,
  });

  String id;
  String libelle;
  String description;
  String prixUn;
  String pvente;
  String quantite;
  String categorie;
  String image;

  factory ProduitModel.fromJson(Map<String, dynamic> json) => ProduitModel(
        id: json["id"],
        libelle: json["libelle"],
        description: json["description"],
        prixUn: json["prix_un"],
        pvente: json["pvente"],
        quantite: json["quantite"],
        categorie: json["categorie"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "description": description,
        "prix_un": prixUn,
        "pvente": pvente,
        "quantite": quantite,
        "categorie": categorie,
        "image": image,
      };
}
