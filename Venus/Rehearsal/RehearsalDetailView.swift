//
//  RehearsalDetailView.swift
//  Venus
//
//  Created by Minsoo Choo on 2024-04-01.
//

import SwiftUI

struct RehearsalDetailView: View {
    var rehearsal: Rehearsal

    var body: some View {
        Form {
            Section("Songs") {
                List(rehearsal.songs, id: \.self) { song in
                    Text(song)
                }
            }
        }
        .navigationTitle(rehearsal.date.formatted())
    }
}

#Preview {
    RehearsalDetailView(rehearsal: Rehearsal(id: 1, date: Date(), songs: ["adf", "fd"]))
}
