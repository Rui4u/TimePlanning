//
//  TimePlanningApp.swift
//  TimePlanning
//
//  Created by 沙睿 on 2021/4/14.
//

import SwiftUI

@main
struct TimePlanningApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
