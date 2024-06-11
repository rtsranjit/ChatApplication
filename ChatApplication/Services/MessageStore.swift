//
//  MessageStore.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 09/06/24.
//

import Foundation

class MessageStore {
    static let shared = MessageStore()
    
    private init() {}
    
    private var messages: [ChatMessage] = []
    
    func addMessage(_ message: ChatMessage) {
        self.messages.append(message)
    }
    
    func getAllMessages() -> [ChatMessage] {
        return self.messages
    }
}
