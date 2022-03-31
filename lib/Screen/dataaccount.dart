import 'package:alquran_app/Screen/editprofil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataAccount extends StatefulWidget {
  const DataAccount({Key key}) : super(key: key);

  @override
  State<DataAccount> createState() => _DataAccountState();
}

class _DataAccountState extends State<DataAccount> {
  String username = "", nama = "", email = "", foto = "", hakakses = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      nama = preferences.getString("nama");
      email = preferences.getString("email");
      hakakses = preferences.getString("hakakses");
      foto = preferences.getString("foto");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text("Personal Data"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                DataAccount("$nama"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Username",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                DataAccount("$username"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                DataAccount("$email"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Roles",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                DataAccount("$hakakses"),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Editprofil()));
                    },
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF00695C),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Edit Profil',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget DataAccount(String title) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          // ignore: missing_required_param
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(58, 58, 58, 1),
                  ),
                )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
