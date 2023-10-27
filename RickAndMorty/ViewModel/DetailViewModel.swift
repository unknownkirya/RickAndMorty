//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 25.10.2023.
//

import Foundation
import UIKit

final class DetailViewModel: DetailViewModelProtocol {
    
    private var characters: Character.Result
    private var episodes: [Episode]?
    private var networkSrvice = NetworkService()
    private var selectedIndexPath: IndexPath?
    
    var name: String {
        return characters.name
    }
    
    var imageUrl: UIImage {
        return networkSrvice.fetchImage(url: characters.image)
    }
    
    var status: String {
        return characters.status.rawValue
    }
    
//    var episodes: [String] {
//        return characters.episode
//    }
    
    init(character: Character.Result) {
        self.characters = character
    }
    
    func fetchEpisode(completion: @escaping () -> ()) {
        var episodesArray: [Episode] = []
        let dispatchGroup = DispatchGroup()
        
        for i in characters.episode {
            dispatchGroup.enter()
            networkSrvice.fetchEpisode(url: i) { [weak self] episode in
                let ep = Episode(episodeExmp: episode)
                episodesArray.append(ep)
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.episodes = episodesArray // Присваиваем episodesArray episodes только после завершения всех запросов
            completion()
        }
    }
    
    func numberOfSections() -> Int {
        return 3
    }
    
    func numberOfRowsInSection() -> Int {
        return characters.episode.count
    }
    
    func selectedItem(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func cellInfoViewModel() -> InfoCellViewModelProtocol {
        return InfoCellViewModel(character: characters)
    }
    
    func cellOriginViewModel() -> OriginCellViewModelProtocol {
        return OriginCellViewModel(characters: characters)
    }
    
    func cellEpisodeViewModel(indexPath: IndexPath) -> EpisodesCellViewModelProtocol {
        return EpisodeCellViewModel(characters: characters, episode: episodes?[indexPath.row] ?? Episode())
    }
}
