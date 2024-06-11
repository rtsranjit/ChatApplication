//
//  ServerView.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 08/06/24.
//

import Foundation
import SwiftUI

//struct ServerView: View {
//    @StateObject private var viewModel = ServerViewModel()
//    @State private var messageText: String = ""
//
//    var body: some View {
//        VStack {
//            List(viewModel.messages) { message in
//                Text("\(message.username): \(message.message)")
//            }
//
//            HStack {
//                TextField("Message", text: $messageText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                Button(action: {
//                    viewModel.broadcastMessage(messageText)
//                    messageText = ""
//                }) {
//                    Text("Broadcast")
//                }
//                .padding()
//            }
//
//            Button(action: {
//                viewModel.startServer()
//            }) {
//                Text("Start Server")
//            }
//            .padding()
//        }
//        .padding()
//    }
//}
