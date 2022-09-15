
import 'package:flutter_webrtc/flutter_webrtc.dart'; 
import 'package:socket_io_client/socket_io_client.dart' as io;



enum ServerStatus { Online, Offline, Connecting }


class Signaling {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late io.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  io.Socket get socket => this._socket;
  
  void _connect() { ///  ws://api-video-chat.desarrollo-web3.com:3100
    // ws://api-chat.desarrollo-web3.com:3000         https://backend-simple-webrtc.herokuapp.com

    _socket = io.io('https://api-video-chat.herokuapp.com', { // https://api-video-chat.herokuapp.com
      // en local tenia mi ip http://192.168.1.5:3100  ....  https://flutter-sockets-server-jean.herokuapp.com/
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
    });

    print('jean Arrancando el Socket');

    _socket.on('connect', (data) {
      print('jean Conectando Sockets');
      this._serverStatus = ServerStatus.Online;
      // notifyListeners();
    });

    // _socket.on('on-join', (isOk) {
    //   print('jean Join Chat: $isOk');
    //   onJoined(isOk);
    //   // notifyListeners();
    // });

    // _socket.on('on-call', (data) async {
    //   print('jean on Call, me estan llamando: $data'); 
    //   // yo escucho la llamada y no he inicializado el peer aqui lo tengo null
    //   await _createPeer();
    //   // tomamos el username del usuario que me llama
    //   final String userName = data['username'];
    //   _him = userName;
    //   final offer = data['offer'];
    //   // definimos RTCSessionDescription 
    //   final RTCSessionDescription description = RTCSessionDescription(offer['sdp'], offer['type']);
    //   // registrar la oferta en el peer de la persona que esta llamando
    //   await _peer.setRemoteDescription(description);
    //   // creamos el constrain, le digo que yo tambien quiero mandar audio y video
    //   final sdpConstraints = {
    //     'mandatory': {
    //       'OfferToReceiveAudio': true,
    //       'OfferToReceiveVideo': true,
    //     },
    //     'optional': []
    //   };
    //   // enviar respuesta al usuario
    //   final RTCSessionDescription answer = await _peer.createAnswer(sdpConstraints);
    //   // registrar la respuesta en mi peer
    //   await _peer.setLocalDescription(answer);
    //   // emitir la respuesta por signaling sockets
    //   emit('answer', { 
    //     'username': _him, 
    //     'answer': answer.toMap()
    //   });

    // });

    // // capturar la respuesta que me envio la persona a la que estoy llamando
    // _socket.on('on-answer', (answer){
    //   print('jean: on answer, Respuesta de quien estoy llamando $answer');
      
    //   // aqui ya tengo el peer creado porque yo soy la persona que esta llamando,
    //   // el peer se creo cuando llame el metodo call()
    //   final RTCSessionDescription description = RTCSessionDescription(answer['sdp'], answer['type']);
    //   _peer.setRemoteDescription(description);
    // });

    //     // capturar la respuesta que me envio la persona a la que estoy llamando
    // _socket.on('on-candidate', (data) async {
    //   print('jean: on candidate, Respuesta del candidato $data'); 
    //   //en este momento peer es distinto de nullo 
    //   // data = { candidate: string, sdpMid: string, sdpMLineIndex: int }
    //   final RTCIceCandidate candidate = RTCIceCandidate(data['candidate'], data['sdpMid'], data['sdpMLineIndex']);
    //   await _peer.addCandidate(candidate);
    // });

    _socket.onDisconnect((_) {
      print('jean Desconectando Socket');
      this._serverStatus = ServerStatus.Offline;
      // notifyListeners();
    });

    _socket.onConnectTimeout((data) => print('jean Tiempo Excedido'));
    _socket.onError((_) => print('jean Error General'));
    _socket.onConnectError((value) => print('jean Error al Conectar el Socket: ${value.toString()}'));
    _socket.on('connect_error', (value) => print('jean Error de Conexion tipo: ${value.toString()}'));

  }


}