//
//  SocketClient.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 08/06/24.
//
//
//import Foundation
//import CocoaAsyncSocket
//
//class SocketClient: NSObject, GCDAsyncSocketDelegate, ObservableObject {
//    private var clientSocket: GCDAsyncSocket!
//    @Published var messages: [ChatMessage] = []
//
//    var username: String
//
//    init(username: String) {
//        self.username = username
//        super.init()
//        clientSocket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
//    }
//
//    func connectToServer() {
//        do {
//            try clientSocket.connect(toHost: "localhost", onPort: 12345)
//            print("Client connected to server")
//        } catch {
//            print("Error connecting to server: \(error)")
//        }
//    }
//
//    func sendMessage(_ message: String) {
//        let chatMessage = ChatMessage(username: username, message: message)
//        if let data = try? JSONEncoder().encode(chatMessage) {
//            clientSocket.write(data, withTimeout: -1, tag: 0)
//        }
//    }
//
//    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
//        if let chatMessage = try? JSONDecoder().decode(ChatMessage.self, from: data) {
//            DispatchQueue.main.async {
//                self.messages.append(chatMessage)
//            }
//        }
//        sock.readData(withTimeout: -1, tag: 0)
//    }
//
//    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
//        print("Connected to \(host) on port \(port)")
//        sock.readData(withTimeout: -1, tag: 0)
//    }
//}
