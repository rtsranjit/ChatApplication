//
//  ContentView.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 08/06/24.
//
import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var isClientViewActive: Bool = false
    @StateObject private var viewModel = ServerViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                NavigationLink(
                    destination: ChatView(username: username),
                    isActive: $isClientViewActive
                ) {
                    Button(action: {
                        viewModel.startServer()
                        isClientViewActive = true
                    }) {
                        Text("Join Chat")
                    }
                    .disabled(username.isEmpty)
                    .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
