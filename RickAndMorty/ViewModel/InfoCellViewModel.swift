//
//  InfoCellViewModel.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 25.10.2023.
//

import Foundation

final class InfoCellViewModel: InfoCellViewModelProtocol {
    
    private var character: Character.Result
    
    var species: String {
        return character.species.rawValue
    }
    
    var type: String {
        guard character.type != "" else { return "None" }
        return character.type
    }
    
    var gender: String {
        return character.gender.rawValue
    }
    
    init(character: Character.Result) {
        self.character = character
    }
}
