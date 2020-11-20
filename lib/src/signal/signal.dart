import 'dart:html';

import 'package:flutter_webrtc/flutter_webrtc.dart';

class Trickle {
  RTCIceCandidate candidate;
  int target;
  Map toMap() => {'role': target, candidate: candidate.toMap()};
}

final RolePub = 0;

final Rolesub = 1;

typedef OnNegotiateCallback = void Function(RtcSessionDescription jsep);
typedef OnReadyCallback = void Function();
typedef OnTrickleCallback = void Function(Trickle trickle);
typedef OnCloseCallback = void Function(int code, String reason);

abstract class Signal {
  OnNegotiateCallback onnegotiate;

  OnReadyCallback onready;

  OnCloseCallback onclose;

  OnTrickleCallback ontrickle;

  Future<RTCSessionDescription> join(String sid, RTCSessionDescription offer);

  Future<RTCSessionDescription> offer(RTCSessionDescription offer);

  void answer(RTCSessionDescription answer);

  void trickle(Trickle trickle);

  void close();
}