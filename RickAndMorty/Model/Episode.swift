//
//  Episode.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 27.10.2023.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
    
    init() {
        id = 0
        name = ""
        airDate = ""
        episode = ""
        characters = []
        url = ""
        created = ""
    }
    
    init(episodeExmp: Episode) {
        id = episodeExmp.id
        name = episodeExmp.name
        airDate = episodeExmp.airDate
        episode = episodeExmp.episode
        characters = episodeExmp.characters
        url = episodeExmp.url
        created = episodeExmp.created
    }
}
