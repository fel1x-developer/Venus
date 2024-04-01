//
//  ConcertView.swift
//  Venus
//
//  Created by Minsoo Choo on 2024-04-01.
//

import SwiftUI

// struct NewsItem: Decodable, Identifiable {
//    let id: Int
//    let title: String
//    let strap: String
// }

struct ConcertView: View {
//    @State private var news = [
//        NewsItem(id: 0, title: "Want the latest news?", strap: "Pull to refresh!")
//    ]

    @State private var concerts: [Concert] = []

    var body: some View {
        NavigationStack {
            Form {
                if !concerts.isEmpty {
                    List(concerts) { concert in
                        VStack(alignment: .leading) {
                            Text(concert.name)
                                .font(.headline)
                            Text(concert.date.formatted())
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .overlay {
                if concerts.isEmpty {
                    ContentUnavailableView("Concert Not Found",
                                           systemImage: "magnifyingglass",
                                           description: Text("Swipe up to refresh")
                    )
                }
            }
            .refreshable {
                concerts = loadConcert(origin: .local, filename: "ConcertData")

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
            .navigationTitle("Concert")
        }
        .task {
            concerts = loadConcert(origin: .local, filename: "ConcertData")
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
    ConcertView()
}
