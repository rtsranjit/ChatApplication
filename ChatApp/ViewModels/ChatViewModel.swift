//
//  ChatViewModel.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 09/06/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    var socketManager: SocketManager
    private var username: String

    init(username: String) {
        self.username = username
        self.socketManager = SocketManager()
        self.setupBindings()
    }

    private func setupBindings() {
        self.socketManager.$messages
            .receive(on: RunLoop.main)
            .assign(to: &$messages)
    }

    func connectToServer() {
        socketManager.connectToServer()
    }

    func sendMessage(_ message: String) {
        let chatMessage = ChatMessage(username: username, message: message)
        socketManager.sendMessage(chatMessage)
    }
}
