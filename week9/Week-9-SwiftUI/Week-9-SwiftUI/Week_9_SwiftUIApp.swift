//
//  Week_9_SwiftUIApp.swift
//  Week-9-SwiftUI
//
//  Created by Kerim Çağlar on 18.04.2024.
//

import SwiftUI
import SwiftData

@main
struct Week_9_SwiftUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
