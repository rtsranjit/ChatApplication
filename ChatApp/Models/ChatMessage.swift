//
//  ChatMessage.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 08/06/24.
//

import Foundation

struct ChatMessage: Identifiable, Codable {
    let id: UUID
    let username: String
    let message: String
    
    init(username: String, message: String) {
        self.id = UUID()
        self.username = username
        self.message = message
    }
}
