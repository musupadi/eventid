import 'package:flutter/material.dart';

import 'Constant/Colors.dart';
import 'Constant/FontSize.dart';
import 'Model/Ascendant.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passenable = true; //boolean value to track password view enable disable.
  bool passenable2 = true; //boolean value to track password view enable disable.
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerPassword2 = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    // Get.to(logins);
    super.initState();
  }

  Checker() async{

    if(controllerUsername.text == ""){
      Message("Required", "Username is Required", context);
    }else if(controllerPassword.text == ""){
      Message("Required", "Password is Required", context);
    }else if(controllerPassword2.text == ""){
      Message("Required", "Confirmation Password is Required", context);
    }else if(controllerName.text == ""){
      Message("Required", "Name is Required", context);
    }else if(controllerEmail.text == ""){
      Message("Required", "Email is Required", context);
    }else{
      if(controllerPassword.text == controllerPassword2.text){
        // isLoading = true;
        // isLoading = await RegisterData(context, controllerUsername.text,controllerPassword.text, controllerName.text,controllerEmail.text);
      }else{
        Message("Required", "Password and Password Confirmation is not same", context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // toLogin(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: <Widget>[
            Container(
              color: BackgroundGray(),
            ),
            Container(
              child: SafeArea(
                child: ListView(
                  children: <Widget>[
                    Container(
                        height: 250,
                        width: double.infinity,
                        child: Image.asset("assets/img/Kembang.png",fit: BoxFit.cover)
                    ),
                    Container(
                      color: PrimaryColors(),
                      height: 50,
                      width: double.infinity,
                      child: Center(child: new Text("Register",style: TextStyle(color: Colors.white,fontSize: 20),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                color: Colors.grey,
                                offset: Offset(0,2),
                                spreadRadius: 2
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: SingleChildScrollView(
                            child: new Column(
                              children: <Widget>[
                                Container(
                                    child: TextField(
                                      controller: controllerUsername,
                                      decoration: InputDecoration(
                                          hintText: 'Your Username...',
                                          prefixIcon: Icon(Icons.person),
                                          labelText: 'Username',
                                          border: OutlineInputBorder(),
                                          suffixIcon: controllerUsername.text.isEmpty ? Container(width: 0,): IconButton(
                                            icon: Icon(
                                                Icons.close,
                                                color: Colors.red),
                                            onPressed: ()=> controllerUsername.clear(),
                                          )
                                      ),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                    )
                                ),
                                SizedBox(height: 20,),
                                Container(
                                    child: TextField(
                                      controller: controllerPassword,
                                      decoration: InputDecoration(
                                          hintText: 'Your Password...',
                                          prefixIcon: Icon(Icons.lock),
                                          labelText: 'Password',
                                          border: OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                              icon: passenable
                                                  ? Icon(Icons.visibility_off)
                                                  : Icon(Icons.visibility),
                                              onPressed: () =>
                                                  setState(() => passenable = !passenable)
                                          )
                                      ),
                                      obscureText: passenable,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                    )
                                ),
                                SizedBox(height: 20,),
                                Container(
                                    child: TextField(
                                      controller: controllerPassword2,
                                      decoration: InputDecoration(
                                          hintText: 'Your Confirm Password...',
                                          prefixIcon: Icon(Icons.lock),
                                          labelText: 'Confirm Password',
                                          border: OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                              icon: passenable2
                                                  ? Icon(Icons.visibility_off)
                                                  : Icon(Icons.visibility),
                                              onPressed: () =>
                                                  setState(() => passenable2 = !passenable2)
                                          )
                                      ),
                                      obscureText: passenable2,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                    )
                                ),
                                SizedBox(height: 20,),
                                Container(
                                    child: TextField(
                                      controller: controllerName,
                                      decoration: InputDecoration(
                                          hintText: 'Your Full Name...',
                                          prefixIcon: Icon(Icons.person),
                                          labelText: 'Full Name',
                                          border: OutlineInputBorder(),
                                          suffixIcon: controllerName.text.isEmpty ? Container(width: 0,): IconButton(
                                            icon: Icon(
                                                Icons.close,
                                                color: Colors.red),
                                            onPressed: ()=> controllerName.clear(),
                                          )
                                      ),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                    )
                                ),
                                SizedBox(height: 20,),
                                Container(
                                    child: TextField(
                                      controller: controllerEmail,
                                      decoration: InputDecoration(
                                          hintText: 'Your Email...',
                                          prefixIcon: Icon(Icons.email),
                                          labelText: 'Email',
                                          border: OutlineInputBorder(),
                                          suffixIcon: controllerEmail.text.isEmpty ? Container(width: 0,): IconButton(
                                            icon: Icon(
                                                Icons.close,
                                                color: Colors.red),
                                            onPressed: ()=> controllerEmail.clear(),
                                          )
                                      ),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                    )
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Checker();
                                      },
                                      child: Container(
                                          width: 200,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.red
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Register",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    // toLogin(context);
                                  },
                                  child: Container(
                                      width: double.maxFinite,
                                      child: Center(
                                        child: Text(
                                          "Back",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: LargeFontSize()
                                          ),
                                        ),
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if(isLoading)
              Stack(
                  children:[
                    Container(
                        color: Colors.black.withOpacity(0.5)
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: CircularProgressIndicator()
                        ),
                        SizedBox(width: double.infinity, height: 20,),
                        Text("Sedang Mencoba Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        )
                      ],
                    )
                  ]
              ),
          ],
        ),
      ),
    );
  }
}
