//
//  SocketManager.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 09/06/24.
//

import Foundation
import CocoaAsyncSocket

class SocketManager: NSObject, GCDAsyncSocketDelegate, ObservableObject {
    private var serverSocket: GCDAsyncSocket!
    private var clientSocket: GCDAsyncSocket!
    private var connectedSockets: [GCDAsyncSocket] = []
    @Published var messages: [ChatMessage] = MessageStore.shared.getAllMessages()
    
    override init() {
        super.init()
        serverSocket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        clientSocket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
    }
    
    // Server Methods
    func startServer() {
        do {
            try serverSocket.accept(onPort: 12345)
            print("Server started on port 12345")
        } catch {
            print("Error starting server: \(error)")
        }
    }
    
    // Client Methods
    func connectToServer() {
        do {
            try clientSocket.connect(toHost: "localhost", onPort: 12345)
            print("Client connected to server")
        } catch {
            print("Error connecting to server: \(error)")
        }
    }
    
    func sendMessage(_ chatMessage: ChatMessage) {
        if let data = try? JSONEncoder().encode(chatMessage) {
            // Write to all connected sockets
            for socket in connectedSockets {
                socket.write(data, withTimeout: -1, tag: 0)
            }
            // Add the message to the list immediately
            DispatchQueue.main.async {
                self.messages.append(chatMessage)
            }
            MessageStore.shared.addMessage(chatMessage)
        }
    }
    
    // Socket Delegate Methods
    func socket(_ sock: GCDAsyncSocket, didAcceptNewSocket newSocket: GCDAsyncSocket) {
        print("Accepted new socket from \(newSocket.connectedHost ?? "") : \(newSocket.connectedPort)")
        connectedSockets.append(newSocket)
        newSocket.readData(withTimeout: -1, tag: 0)
    }
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        if let chatMessage = try? JSONDecoder().decode(ChatMessage.self, from: data) {
            for socket in connectedSockets {
                if socket != sock {
                    socket.write(data, withTimeout: -1, tag: 1)
                }
            }
            let isNewMessage = !MessageStore.shared.getAllMessages().contains { storedMessage in
                storedMessage.id == chatMessage.id
            }
            if isNewMessage {
                MessageStore.shared.addMessage(chatMessage)
            }
            DispatchQueue.main.async {
                self.messages.append(chatMessage)
            }
        }
        sock.readData(withTimeout: -1, tag: 0)
    }
    
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print("Connected to \(host) on port \(port)")
        connectedSockets.append(sock)
        sock.readData(withTimeout: -1, tag: 0)
    }
    
}


