import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat/models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(email: 'jaimi@gmail.com', nombre: 'Jaimi', online: true, uid: '1'),
    Usuario(
        email: 'miguel@gmail.com', nombre: 'Miguel', online: true, uid: '2'),
    Usuario(email: 'ramon@gmail.com', nombre: 'Ramon', online: true, uid: '3'),
    Usuario(email: 'pedro@gmail.com', nombre: 'Pedro', online: true, uid: '4'),
  ];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jaime',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          color: Colors.blue,
          icon: Icon(Icons.exit_to_app),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            // child: Icon(Icons.check_circle, color: Colors.green,),
            child: Icon(
              Icons.offline_bolt,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Center(
        child: SmartRefresher(
          header: WaterDropHeader(
            complete: Icon(
              Icons.check,
              color: Colors.blue[300],
            ),
          ),
          onRefresh: _cargarUsuario,
          controller: _refreshController,
          enablePullDown: true,
          child: _listviewUsuarios(),
        ),
      ),
    );
  }

  ListView _listviewUsuarios() {
    return ListView.separated(
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: this.usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          child: Text(usuario.nombre.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: usuario.online ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(100)),
        ));
  }

  _cargarUsuario() async {
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
