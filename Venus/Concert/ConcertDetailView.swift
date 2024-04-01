//
//  ConcertDetailView.swift
//  Venus
//
//  Created by Minsoo Choo on 2024-04-01.
//

import SwiftUI

struct ConcertDetailView: View {
    var concert: Concert

    var body: some View {
        Form {
            Section("\(concert.date.formatted())") {
                List(concert.songs, id: \.self) { song in
                    Text(song)
                }
            }
        }
        .navigationTitle(concert.name)
    }
}

#Preview {
    ConcertDetailView(concert: Concert(id: 1, name: "Nationals", date: Date(), songs: ["adf", "fd"]))
}
