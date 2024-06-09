// import 'package:flutter/material.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import "package:google_fonts/google_fonts.dart";
// import 'package:provider/provider.dart';
//
// import '../../Providers/Messages_Provider.dart';
// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);
//
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
// List<types.Message> _messages = [];
//   final _user = const types.User(
//     id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
//   );
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Chat with Supervisor",
//           style: GoogleFonts.poppins(
//               fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         backgroundColor: Colors.indigo[900],
//         centerTitle: true,
//         actions: [
//           Container(
//             width: 50,
//             padding: EdgeInsets.symmetric(
//               horizontal: 10,
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Chat(messages: _messages ,user: _user, onSendPressed: _handleSendPressed),
//       ),
//     );
//   }
//   void _handleSendPressed(types.PartialText message) {
//     var MessageProvider = Provider.of<MessagingService>(context, listen: false);
//     MessageProvider.setSentMessage(message.text);
//     final textMessage = types.TextMessage(
//       author: _user,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: "id",
//       text: message.text,
//     );
//     _addMessage(textMessage);
//     MessageProvider.sendMessage(context);
//   }
//   void _addMessage(types.Message message) {
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }
//
// }

// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
// import 'package:image_picker/image_picker.dart';


// class Screen extends StatefulWidget {
//   const Screen({super.key});
//
//   @override
//   State<Screen> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<Screen> {
//   final Gemini gemini = Gemini.instance;
//
//   List<ChatMessage> messages = [];
//
//   ChatUser currentUser = ChatUser(id: "0", firstName: "User");
//   ChatUser geminiUser = ChatUser(
//     id: "1",
//     firstName: "Gemini",
//     profileImage:
//     "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Gemini Chat",
//         ),
//       ),
//       body: _buildUI(),
//     );
//   }
//
//   Widget _buildUI() {
//     return DashChat(
//       inputOptions: InputOptions(trailing: [
//         IconButton(
//           onPressed: _sendMediaMessage,
//           icon: const Icon(
//             Icons.image,
//           ),
//         )
//       ]),
//       currentUser: currentUser,
//       onSend: _sendMessage,
//       messages: messages,
//     );
//   }
//
//   void _sendMessage(ChatMessage chatMessage) {
//     setState(() {
//       messages = [chatMessage, ...messages];
//     });
//     try {
//       String question = chatMessage.text;
//       List<Uint8List>? images;
//       if (chatMessage.medias?.isNotEmpty ?? false) {
//         images = [
//           File(chatMessage.medias!.first.url).readAsBytesSync(),
//         ];
//       }
//       gemini
//           .streamGenerateContent(
//         question,
//         images: images,
//       )
//           .listen((event) {
//         ChatMessage? lastMessage = messages.firstOrNull;
//         if (lastMessage != null && lastMessage.user == geminiUser) {
//           lastMessage = messages.removeAt(0);
//           String response = event.content?.parts?.fold(
//               "", (previous, current) => "$previous ${current.text}") ??
//               "";
//           lastMessage.text += response;
//           setState(
//                 () {
//               messages = [lastMessage!, ...messages];
//             },
//           );
//         } else {
//           String response = event.content?.parts?.fold(
//               "", (previous, current) => "$previous ${current.text}") ??
//               "";
//           ChatMessage message = ChatMessage(
//             user: geminiUser,
//             createdAt: DateTime.now(),
//             text: response,
//           );
//           setState(() {
//             messages = [message, ...messages];
//           });
//         }
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   void _sendMediaMessage() async {
//     ImagePicker picker = ImagePicker();
//     XFile? file = await picker.pickImage(
//       source: ImageSource.gallery,
//     );
//     if (file != null) {
//       ChatMessage chatMessage = ChatMessage(
//         user: currentUser,
//         createdAt: DateTime.now(),
//         text: "Describe this picture?",
//         medias: [
//           ChatMedia(
//             url: file.path,
//             fileName: "",
//             type: MediaType.image,
//           )
//         ],
//       );
//       _sendMessage(chatMessage);
//     }
//   }
// }


/////   OLD   ABOVE
/////   NEW   BELOW



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../Providers/Messages_Provider.dart';

// void main() {
//   // initializeDateFormatting().then((_) => runApp(const MyApp()));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Directionality(
      textDirection: TextDirection.ltr,
      child: ChatPage(),
    ),
  );
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  String lastFetchedMessage = '';
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  final _dummyUser = const types.User(
    id: '12345678-1234-1234-1234-123456789012',
    firstName: 'Supervisor',
    // lastName: 'User',
  );

  @override
  void initState() {
    // final MessagingProvider = Provider.of<MessagingService>(context,listen: false);
    // MessagingProvider.fetchSupervisorMessages(context);
    // MessagingProvider.setCurrentMessage(MessagingProvider.getSupervisorMessage);
    // String currentmsg   = MessagingProvider.getCurrentorMessage;
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleMessageTap(BuildContext _, types.Message message) {
    // Handle message tap if needed
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    final MessageProvider = Provider.of<MessagingService>(context,listen: false);
    MessageProvider.setSentMessage(textMessage.text.toString());

    Future.delayed(Duration(seconds:2),(){MessageProvider.sendMessage(context);});
    // Send the message to the server
    // try {
    //   final response = await http.post(
    //     Uri.parse('https://your-api-url.com/send-message'),
    //     headers: {'Content-Type': 'application/json'},
    //     body: jsonEncode({
    //       'author': _user.id,
    //       'text': message.text,
    //     }),
    //   );
    //
    //   if (response.statusCode != 200) {
    //     // Handle server error
    //     print('Failed to send message');
    //   }
    // } catch (e) {
    //   // Handle network error
    //   print('Error sending message: $e');
    // }
  }

  void _addDummyMessage() {
    final MessagingProvider = Provider.of<MessagingService>(context,listen: false);
    MessagingProvider.fetchSupervisorMessages(context);

    Future.delayed(Duration(milliseconds: 3500), () {
      final newMessage = MessagingProvider.getSupervisorMessage;
      // Check if the fetched message is different from the last fetched message
      if (newMessage != lastFetchedMessage) {
        // Update the last fetched message
        lastFetchedMessage = newMessage;

        // Add the message to the UI
        final dummyMessage = types.TextMessage(
          author: _dummyUser,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text: newMessage,
        );

        // Add code to display the dummyMessage in the UI
        _addMessage(dummyMessage);
      }
      // final dummyMessage = types.TextMessage(
      //   author: _dummyUser,
      //   createdAt: DateTime.now().millisecondsSinceEpoch,
      //   id: const Uuid().v4(),
      //   text: MessagingProvider.getSupervisorMessage,
      // );


      // String currentmsg   = MessagingProvider.getCurrentMessage;
      // String SupervisorMsg   = MessagingProvider.getSupervisorMessage;
      // if(currentmsg==SupervisorMsg){
      //   print("DEAD");
      // };
      // print("currentmsg:${currentmsg}");
      // print("SupervisorMsg:${SupervisorMsg}");
    });


  }


  void _fetchNewMessages() async {
    try {
      final response = await http.get(Uri.parse('https://your-api-url.com/new-messages'));
      if (response.statusCode == 200) {
        final List<dynamic> newMessages = jsonDecode(response.body);
        for (var messageData in newMessages) {
          final message = types.Message.fromJson(messageData);
          _addMessage(message);
        }
      } else {
        // Handle server error
        print('Failed to load new messages');
      }
    } catch (e) {
      // Handle network error
      print('Error fetching new messages: $e');
    }
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Chat'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: _addDummyMessage,
        ),
        IconButton(
          icon: const Icon(Icons.message),
          onPressed: _addDummyMessage,
        ),
      ],
    ),
    body: Chat(
      messages: _messages,
      onMessageTap: _handleMessageTap,
      onPreviewDataFetched: _handlePreviewDataFetched,
      onSendPressed: _handleSendPressed,
      showUserAvatars: true,
      showUserNames: true,
      user: _user,
    ),
  );
}

