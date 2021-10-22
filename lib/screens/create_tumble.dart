import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tumble/screens/dashboard.dart';
import 'package:tumble/models/tumbles.dart';

final tumbleText = TextEditingController();
void clearText() {
  tumbleText.clear();
}

class CreateTumble extends StatefulWidget {
  const CreateTumble({Key? key}) : super(key: key);

  @override
  State<CreateTumble> createState() => _CreateTumbleState();
}

class _CreateTumbleState extends State<CreateTumble> {
  String _enteredText = '';
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: TextField(
          controller: tumbleText,
          maxLength: 240,
          onChanged: (value) {
            setState(() {
              _enteredText = value;
            });
          },
          cursorColor: Color(0xffC84B31),
          maxLines: null,
          style: TextStyle(
              color: Color(0xffECDBBA),
              fontWeight: FontWeight.w500,
              fontSize: 18),
          decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              filled: true,
              fillColor: Color(0xff1A1A1A),
              focusColor: Color(0xff1A1A1A),
              hintText: "What's Interesting? . . .",
              prefixIcon: ImageIcon(
                AssetImage("assets/images/SmallLogo.png"),
                color: Color(0xffECDBBA),
              ),
              hintStyle: TextStyle(
                fontWeight: FontWeight.w200,
                fontFamily: "Lato",
                color: Color(0xffECDBBA).withOpacity(0.2),
              )),
        ),
      )),
      backgroundColor: Color(0xff1F1F1F),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        color: Color(0xff272727),
        child: IconTheme(
          data: IconThemeData(color: Color(0xffECDBBA)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.image_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.sticky_note_2_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.poll_rounded),
                onPressed: () {},
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                _enteredText.length.toString() + "/240 character(s)",
                style: TextStyle(
                    color: Color(0xffECDBBA),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              )
              //counterText: '${_enteredText.length.toString()} character(s)',
            ],
          ),
        ),
      ),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color(0xff272727),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      text: 'Cancel',
                      style: TextStyle(fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard())))),
              ElevatedButton(
                onPressed: _enteredText.isEmpty
                    ? null
                    : () async {
                        userTumbles.add(
                            // ignore: unnecessary_new
                            new TumbleRecorder(tumble: tumbleText.text));
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                        setState(() {
                          _check = false;
                          tumbleText.clear();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Tumbled')));
                        });
                      },
                child: Text('Let them know!',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffC84B31)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)))),
              ),
            ],
          )),
    );
  }
}
