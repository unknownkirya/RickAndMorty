//
//  InfoCellProtocol.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 25.10.2023.
//

import Foundation

protocol InfoCellViewModelProtocol {
    var species: String { get }
    var type: String { get }
    var gender: String { get }
}
