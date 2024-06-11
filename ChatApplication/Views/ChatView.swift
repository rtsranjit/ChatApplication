//
//  ChatView.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 08/06/24.
//

import Foundation
import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel: ChatViewModel
    @State private var messageText: String = ""
    private var username = ""

    init(username: String) {
        _viewModel = StateObject(wrappedValue: ChatViewModel(username: username))
        self.username = username
    }

    var body: some View {
        VStack {
            List(viewModel.socketManager.messages) { message in
                HStack {
                    if self.username == message.username {
                        Spacer()
                        ChatBubble(message: message, isCurrentUser: true)
                    } else {
                        ChatBubble(message: message, isCurrentUser: false)
                        Spacer()
                    }
                }
                .listRowSeparator(.hidden)
            }

            HStack {
                TextField("Message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    viewModel.sendMessage(messageText)
                    messageText = ""
                }) {
                    Text("Send")
                }
                .disabled(messageText.isEmpty)
                .padding()
            }
        }
        .onAppear {
            viewModel.connectToServer()
        }
        .padding()
    }
}

