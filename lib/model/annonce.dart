class Annonce{

  int id;
  String libelle;
  String description;
  String createdAt;
  String updatedAt;
  int version;

  Annonce(
      {this.id,
      this.libelle,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.version});

  @override
  String toString() {
    return 'Annonce{id: $id, libelle: $libelle, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, version: $version}';
  }

  factory Annonce.fromJson(Map<String, dynamic> json) {
    return Annonce(
        id : json['id'],
        libelle : json['libelle'],
        description : json['description'],
        createdAt : json['createdAt'],
        updatedAt : json['updatedAt'],
        version : json['version']
    );
  }
}