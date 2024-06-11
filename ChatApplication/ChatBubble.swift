//
//  ChatBubble.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 09/06/24.
//

import SwiftUI

struct ChatBubble: View {
    var message: ChatMessage
    var isCurrentUser: Bool

    var body: some View {
        VStack {
            Group {
                Text(isCurrentUser ? "" : "~ \(message.username)\n").bold() + Text(message.message)
            }
            .padding(10)
            .foregroundColor(.white)
            .background(isCurrentUser ? Color.blue : Color.green)
            .cornerRadius(10)
            .multilineTextAlignment(isCurrentUser ? .trailing : .leading)
            .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        }
    }
}

#Preview {
    ChatBubble(message: ChatMessage(username: "username", message: "message"), isCurrentUser: false)
}
