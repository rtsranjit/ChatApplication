//
//  ServerViewModel.swift
//  ChatAppllication
//
//  Created by Ranjit Singh on 08/06/24.
//

import Foundation

class ServerViewModel: ObservableObject {
    @Published var socketManager = SocketManager()

    func startServer() {
        socketManager.startServer()
    }

}
