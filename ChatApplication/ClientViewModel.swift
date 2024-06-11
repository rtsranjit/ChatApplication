//
//  ClientViewModel.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 08/06/24.
//

import Foundation

//class ClientViewModel: ObservableObject {
//    @Published var client: SocketClient
//    @Published var messages: [ChatMessage] = []
//
//    init(username: String) {
//        self.client = SocketClient(username: username)
//        self.client.$messages
//            .receive(on: RunLoop.main)
//            .assign(to: &$messages)
//    }
//
//    func connectToServer() {
//        client.connectToServer()
//    }
//
//    func sendMessage(_ message: String) {
//        client.sendMessage(message)
//    }
//}

//class ClientViewModel: ObservableObject {
//    @Published var messages: [ChatMessage] = []
//    var socketManager: SocketManager
//    private var username: String
//
//    init(username: String) {
//        self.username = username
//        self.socketManager = SocketManager()
//        self.setupBindings()
//    }
//
//    private func setupBindings() {
//        self.socketManager.$messages
//            .receive(on: RunLoop.main)
//            .assign(to: &$messages)
//    }
//
//    func connectToServer() {
//        socketManager.connectToServer()
//    }
//
//    func sendMessage(_ message: String) {
//        let chatMessage = ChatMessage(username: username, message: message)
//        socketManager.sendMessage(chatMessage)
//    }
//}
