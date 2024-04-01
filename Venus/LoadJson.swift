//
//  LoadJson.swift
//  Venus
//
//  Created by Minsoo Choo on 2024-04-01.
//

import Foundation

enum LoadOrigin {
    case local, web
}

struct Concert: Decodable, Identifiable {
    var id: Int
    var name: String
    var bands: [ConcertBand]
    var date: Date
}

struct ConcertBand: Decodable, Identifiable {
    var id: Int
    var name: String
    var songs: [String]
}

func fetchConcertData(origin: LoadOrigin, filename fileName: String) -> [Concert]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)

            // FORMAT DATE
            let dateFormatter = DateFormatter()
            // Force dateFormatter to be always 24h
            dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm a")
            dateFormatter.amSymbol = ""
            dateFormatter.pmSymbol = ""
            dateFormatter.locale = Locale(identifier: "en_CA")
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try decoder.decode([Concert].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

func loadConcert(origin: LoadOrigin, filename fileName: String) -> [Concert] {
    let concerts: [Concert] = fetchConcertData(origin: origin, filename: fileName) ?? []
    
    let filteredConcerts = concerts.filter { concert in
        concert.date > Date()
    }
    
    return filteredConcerts
}

struct Rehearsal: Decodable, Identifiable {
    var id: Int
    var date: Date
    var songs: [String]
}

func fetchRehearsalData(origin: LoadOrigin, filename fileName: String) -> [Rehearsal]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)

            // FORMAT DATE
            let dateFormatter = DateFormatter()
            // Force dateFormatter to be always 24h
            dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm a")
            dateFormatter.amSymbol = ""
            dateFormatter.pmSymbol = ""
            dateFormatter.locale = Locale(identifier: "en_CA")
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try decoder.decode([Rehearsal].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

func loadRehearsal(origin: LoadOrigin, filename fileName: String) -> [Rehearsal] {
    let rehearsals: [Rehearsal] = fetchRehearsalData(origin: origin, filename: fileName) ?? []
    
    let filteredRehearsals = rehearsals.filter { rehearsal in
        rehearsal.date > Date()
    }
    
    return filteredRehearsals
}
