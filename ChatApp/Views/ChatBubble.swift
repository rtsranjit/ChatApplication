//
//  ChatBubble.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 09/06/24.
//

import Foundation
import SwiftUI

struct ChatBubble: View {
    var message: ChatMessage
    var isCurrentUser: Bool

    var body: some View {
        VStack {
            Text(isCurrentUser ? message.message : "\(message.username): \(message.message)")
                .padding(10)
                .foregroundColor(.white)
                .background(isCurrentUser ? Color.blue : Color.green)
                .cornerRadius(10)
                .multilineTextAlignment(isCurrentUser ? .trailing : .leading)
                .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        }
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(message: ChatMessage(username: "username", message: "message"), isCurrentUser: false)
//            .previewLayout(PreviewLayout.sizeThatFits)
//            .padding()
//            .previewDisplayName("Default preview")
    }
}
