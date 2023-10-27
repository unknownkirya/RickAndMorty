//
//  EpisodesCellViewModel.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 26.10.2023.
//

import Foundation

final class EpisodeCellViewModel: EpisodesCellViewModelProtocol {

    private let networkService = NetworkService()
    private var characters: Character.Result
    private var episode: Episode
    
    var title: String {
        return episode.name
    }
    
    var episodeNumber: String? {
        if let rangeE = episode.episode.range(of: "E") {
            let startIndexE = rangeE.upperBound
            let episodeSubstring = episode.episode[startIndexE...]
            if let episodeNumber = Int(episodeSubstring) {
                return String(describing: episodeNumber)
            }
        }
        return nil
    }
    
    var seasonNumber: String? {
        if let rangeS = episode.episode.range(of: "S"), let rangeE = episode.episode.range(of: "E") {
            let startIndexS = rangeS.upperBound
            let seasonSubstring = episode.episode[startIndexS..<rangeE.lowerBound]
            if let seasonNumber = Int(seasonSubstring) {
                return String(describing: seasonNumber)
            }
        }
        return nil
    }
    
    var date: String {
        return episode.airDate
    }
    
//    func fetchEpisode(indexPath: IndexPath, completion: @escaping () -> ()) {
//        networkService.fetchEpisode(url: characters.episode[indexPath.row]) { [weak self] episode in
//            self?.episode = episode
//            print(episode)
//            completion()
//        }
//    }
    init(characters: Character.Result, episode: Episode) {
        self.characters = characters
        self.episode = episode
    }
}
