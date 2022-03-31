class Membersku {
  final String id;
  final String nama;
  final String username;
  final String password;
  final String email;
  final String bio;
  final String hakakses;
  final String foto;

  Membersku(
      {this.id,
      this.nama,
      this.username,
      this.password,
      this.email,
      this.bio,
      this.hakakses,
      this.foto});

  factory Membersku.fromJson(Map<dynamic, dynamic> json) {
    return Membersku(
        id: json['id'],
        nama: json['nama'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        bio: json['bio'],
        hakakses: json['hakakses'],
        foto: json['foto']);
  }
}
