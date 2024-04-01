//
//  ContentView.swift
//  Venus
//
//  Created by Minsoo Choo on 2024-04-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RehearsalView()
                .tabItem {
                    Label("Rehearsal", systemImage: "music.note.house.fill")
                }

            ConcertView()
                .tabItem {
                    Label("Concert", systemImage: "music.mic")
                }
        }
    }

    init () {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "AccentColor") ?? .systemTeal
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(named: "AccentColor") ?? .systemTeal
        ]
    }
}

#Preview {
    ContentView()
}
