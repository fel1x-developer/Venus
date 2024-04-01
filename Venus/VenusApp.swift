//
//  VenusApp.swift
//  Venus
//
//  Created by Minsoo Choo on 2024-04-01.
//

import SwiftUI

@main
struct VenusApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    init() {
        UIView.appearance(for: UITraitCollection(userInterfaceStyle: .light),
          whenContainedInInstancesOf: [UIAlertController.self])
        .tintColor = UIColor(red: 0.043, green: 0.106, blue: 0.204, alpha: 1)
        UIView.appearance(for: UITraitCollection(userInterfaceStyle: .dark),
          whenContainedInInstancesOf: [UIAlertController.self])
        .tintColor = UIColor(red: 0.906, green: 0.733, blue: 0.427, alpha: 1)
    }
}
