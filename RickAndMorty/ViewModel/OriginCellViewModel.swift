//
//  OriginCellViewModel.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 26.10.2023.
//

import Foundation
import UIKit

final class OriginCellViewModel: OriginCellViewModelProtocol {
    
    private var characters: Character.Result
    
    var locationName: String {
        return characters.origin.name
    }
    
    init(characters: Character.Result) {
        self.characters = characters
    }
}
