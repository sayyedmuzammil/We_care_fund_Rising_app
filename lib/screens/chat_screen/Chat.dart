class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;
  Chat({
    required this.name, 
    required this.lastMessage, 
    required this.image,
     required this.time,
     required this.isActive,
  });
}
List chatsData=[
  Chat
  (
    name:"Shameem", 
    lastMessage: "Hello testing 1", 
    image: "https://th.bing.com/th/id/OIP.1YVWKTxoz89dBWeft0-YEAHaLF?w=124&h=186&c=7&r=0&o=5&dpr=2.2&pid=1.7", 
    time: "3m ago", 
    isActive: false, 
    
  )
];
