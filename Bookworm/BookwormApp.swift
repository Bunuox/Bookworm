//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Bünyamin Kılıçer on 22.02.2022.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
