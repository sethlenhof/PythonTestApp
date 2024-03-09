//
//  PythonTestAppApp.swift
//  PythonTestApp
//
//  Created by Seth Lenhof on 3/8/24.
//

import SwiftUI
import Python


@main
struct PythonTestAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
