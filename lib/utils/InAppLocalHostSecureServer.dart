import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mime/mime.dart';

class InAppLocalHostSecureServer {
  bool _started = false;
  HttpServer? _server;
  MimeTypeResolver mimeTypeResolver = MimeTypeResolver();
  int _port = 8443;

  InAppLocalHostSecureServer({int port = 8443}) {
    _port = port;
  }

  ///Starts a server on http://localhost:[port]/.
  ///
  ///**NOTE for iOS**: For the iOS Platform, you need to add the `NSAllowsLocalNetworking` key with `true` in the `Info.plist` file (See [ATS Configuration Basics](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW35)):
  ///```xml
  ///<key>NSAppTransportSecurity</key>
  ///<dict>
  ///    <key>NSAllowsLocalNetworking</key>
  ///    <true/>
  ///</dict>
  ///```
  ///The `NSAllowsLocalNetworking` key is available since **iOS 10**.
  Future<void> start() async {
    if (_started) {
      throw Exception('Server already started on https://localhost:$_port');
    }

    var completer = Completer();

    runZoned(() async {
      SecurityContext context = SecurityContext();
      var chain = await rootBundle.load('assets/certificates/cert.pem');
      var key = await rootBundle.load('assets/certificates/key.pem');
      context.useCertificateChainBytes(chain.buffer.asInt8List());
      context.usePrivateKeyBytes(key.buffer.asInt8List());

      HttpServer.bindSecure('127.0.0.1', _port, context).then((server) {
        print('Server running on https://localhost:$_port');

        _server = server;

        server.listen((HttpRequest request) async {
          Uint8List body = Uint8List(0);

          print(request);
          var path = request.requestedUri.path;
          path = (path.startsWith('/')) ? path.substring(1) : path;
          path += (path.endsWith('/')) ? 'index.html' : '';

          try {
            body = (await rootBundle.load(path)).buffer.asUint8List();
          } catch (e) {
            print(e.toString());
            request.response.close();
            return;
          }

          var contentType = ContentType('text', 'html', charset: 'utf-8');
          if (!request.requestedUri.path.endsWith('/') &&
              request.requestedUri.pathSegments.isNotEmpty) {
            var mimeType = mimeTypeResolver.lookup(request.requestedUri.path);
            if (mimeType != null) {
              contentType = _getContentTypeFromMimeType(mimeType);
            }
          }

          request.response.headers.contentType =
              request.response.headers.contentType = contentType;
          request.response.add(body);
          request.response.close();
        });

        completer.complete();
      });
    }, onError: (e, stackTrace) {
      print('Error: $e $stackTrace');
    });

    return completer.future;
  }

  ///Closes the server.
  Future<void> close() async {
    if (_server != null) {
      return;
    }
    await _server!.close(force: true);
    print('Server running on http://localhost:$_port closed');
    _started = false;
    _server = null;
  }

  ///Indicates if the server is running or not.
  bool isRunning() {
    return _server != null;
  }

  ContentType _getContentTypeFromMimeType(String mimeType) {
    final contentType = mimeType.split('/');
    String? charset;

    if (_isTextFile(mimeType)) {
      charset = 'utf-8';
    }
    return ContentType(contentType[0], contentType[1], charset: charset);
  }

  bool _isTextFile(String mimeType) {
    final textFile = RegExp(r'^text\/|^application\/(javascript|json)');
    return textFile.hasMatch(mimeType);
  }
}
