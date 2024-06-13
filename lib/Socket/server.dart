import "package:socket_io/socket_io.dart";

void main(List<String> args) {
  Server io = Server();

  io.on("connect", (client) {
    print("Connection occurred");

    client.on("msg", (data) {
      print("Message received: $data");
    });
  });

  io.listen(3000);
  print("Socket IO server running on port 3000");
}
