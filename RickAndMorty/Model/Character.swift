//
//  CharactersModel.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 18.10.2023.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Character.Info
    let results: [Character.Result]
}

struct Character: Codable {
    // MARK: - Welcome
    struct Welcome: Codable {
        let info: Info
        let results: [Result]
    }

    // MARK: - Info
    struct Info: Codable {
        let count, pages: Int
        let next: String
        let prev: JSONNull?
    }

    // MARK: - Result
    struct Result: Codable {
        let id: Int
        let name: String
        let status: Status
        let species: Species
        let type: String
        let gender: Gender
        let origin, location: Location
        let image: String
        let episode: [String]
        let url: String
        let created: String
    }

    enum Gender: String, Codable {
        case female = "Female"
        case male = "Male"
        case unknown = "unknown"
    }

    // MARK: - Location
    struct Location: Codable {
        let name: String
        let url: String
    }

    enum Species: String, Codable {
        case alien = "Alien"
        case human = "Human"
    }

    enum Status: String, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }

}
