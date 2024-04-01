//
//  RehearsalView.swift
//  Venus
//
//  Created by Minsoo Choo on 2024-04-01.
//

import SwiftUI

struct RehearsalView: View {
    //    @State private var news = [
    //        NewsItem(id: 0, title: "Want the latest news?", strap: "Pull to refresh!")
    //    ]

    @State private var rehearsals: [Rehearsal] = []

    var body: some View {
        NavigationStack {
            Form {
                if !rehearsals.isEmpty {
                    List(rehearsals) { rehearsal in
                        VStack(alignment: .leading) {
                            Text(rehearsal.date.formatted())
                                .font(.headline)
                            Text(rehearsal.songs.joined(separator: ", "))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .overlay {
                if rehearsals.isEmpty {
                    ContentUnavailableView("Rehearsal Not Found",
                                           systemImage: "magnifyingglass",
                                           description: Text("Swipe up to refresh")
                    )
                }
            }
            .refreshable {
                rehearsals = loadRehearsal(origin: .local, filename: "RehearsalData")

                //                do {
                //                    // Fetch and decode JSON into news items
                //
                //                    let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
                //                    let (data, _) = try await URLSession.shared.data(from: url)
                //                    concerts = try JSONDecoder().decode([Concert].self, from: data)
                //                } catch {
                //                    // Something went wrong; clear the news
                //                    concerts = []
                //                }
            }
            .navigationTitle("Rehearsal")
        }
        .task {
            rehearsals = loadRehearsal(origin: .local, filename: "RehearsalData")
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
    RehearsalView()
}
