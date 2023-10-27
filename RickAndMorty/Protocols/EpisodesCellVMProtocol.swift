//
//  EpisodesCellVMProtocol.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 26.10.2023.
//

import Foundation

protocol EpisodesCellViewModelProtocol {
    var title: String { get }
    var episodeNumber: String? { get }
    var seasonNumber: String? { get }
    var date: String { get }
    
    //func fetchEpisode(indexPath: IndexPath, completion: @escaping() -> ())
}
