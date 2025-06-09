import 'package:bipbiip/ChangeEmail.dart';
import 'package:bipbiip/ChangePassword.dart';
import 'package:bipbiip/ChangePhoneNumber.dart';
import 'package:bipbiip/about_us.dart';
import 'package:flutter/material.dart';
import 'main.dart';
class SettingPageUI extends StatelessWidget {
  const SettingPageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: const Text("Ayarlar", style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal)),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);

          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //Color.fromRGBO(245, 101, 3, 1),
              Color.fromRGBO(211, 87, 3, 1),
              Color.fromRGBO(24, 28, 79, 1),
              Color.fromRGBO(14, 17,53, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 200.0,
                ),

              ],
            ),
            const Divider(height: 50),
            const SizedBox(height: 10),
           /* Row(
              children: <Widget> [
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                  size: 30.0,
                ),
                const Divider(height: 50, thickness: 30),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Dil Seçeneği",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),*/
            /*Row(
              children: <Widget> [
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                  size: 30.0,
                ),
                const Divider(height: 50, thickness: 30),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {
                    //MyApp.themeNotifier.value =
                    //MyApp.themeNotifier.value == ThemeMode.light
                      //  ? ThemeMode.dark
                        //: ThemeMode.light;
                  },
                  child: const Text("Temayı değiştir",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                ),

              ],
            ),*/
            Row(
              children: <Widget> [
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                  size: 30.0,
                ),
                const Divider(height: 50, thickness: 30),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Servis Takip",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
            Row(
              children: <Widget> [
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                  size: 30.0,
                ),
                const Divider(height: 50, thickness: 30),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ChangePassword()));
                  },
                  child: const Text("Şifre değiştir",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
            Row(
              children: <Widget> [
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                  size: 30.0,
                ),
                const Divider(height: 50, thickness: 30),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ChangePhoneNumber()));
                  },
                  child: const Text("Telefon numarası değiştir",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
            Row(
              children: <Widget> [
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                  size: 30.0,
                ),
                const Divider(height: 50, thickness: 30),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ChangeEmail()));
                  },
                  child: const Text("Mail adresi değiştir",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            /*Row(
              children: <Widget> [
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                  size: 30.0,
                ),
                const Divider(height: 50, thickness: 30),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AboutUs()));
                  },
                  child: const Text("Hakkımızda",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}

class LanguageSelection extends StatelessWidget{
  const LanguageSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dil Seçeneği'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),

      ),
    );
  }
}
