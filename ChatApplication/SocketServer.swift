//
//  SocketServer.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 08/06/24.
//

import Foundation
import CocoaAsyncSocket

//class SocketServer: NSObject, GCDAsyncSocketDelegate, ObservableObject {
//    private var serverSocket: GCDAsyncSocket!
//    private var connectedSockets: [GCDAsyncSocket] = []
//    @Published var messages: [ChatMessage] = []
//
//    override init() {
//        super.init()
//        serverSocket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
//    }
//
//    func startServer() {
//        do {
//            try serverSocket.accept(onPort: 12345)
//            print("Server started on port 12345")
//        } catch {
//            print("Error starting server: \(error)")
//        }
//    }
//
//    func socket(_ sock: GCDAsyncSocket, didAcceptNewSocket newSocket: GCDAsyncSocket) {
//        print("Accepted new socket from \(newSocket.connectedHost ?? "") : \(newSocket.connectedPort)")
//        connectedSockets.append(newSocket)
//        newSocket.readData(withTimeout: -1, tag: 0)
//    }
//
//    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
//        if let chatMessage = try? JSONDecoder().decode(ChatMessage.self, from: data) {
//            DispatchQueue.main.async {
//                self.messages.append(chatMessage)
//            }
//            broadcast(message: chatMessage, from: sock)
//        }
//        sock.readData(withTimeout: -1, tag: 0)
//    }
//
//    func broadcast(message: ChatMessage, from senderSocket: GCDAsyncSocket) {
//        if let data = try? JSONEncoder().encode(message) {
//            for socket in connectedSockets {
//                if socket != senderSocket {
//                    socket.write(data, withTimeout: -1, tag: 0)
//                }
//            }
//        }
//    }
//
//    func broadcast(message: ChatMessage) {
//        if let data = try? JSONEncoder().encode(message) {
//            for socket in connectedSockets {
//                socket.write(data, withTimeout: -1, tag: 0)
//            }
//        }
//    }
//}
