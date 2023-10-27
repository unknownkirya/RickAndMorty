//
//  CollectionVIewCellVM.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 20.10.2023.
//

import Foundation
import UIKit

final class CollectionVIewCellVM: CollectionViewCellVMProtocol {
    
    private let networkService = NetworkService()
    private var character: Character.Result
    
    var name: String {
        return character.name
    }
    
    var imageUrl: UIImage {
        return networkService.fetchImage(url: character.image)
    }
    
    init(character: Character.Result) {
        self.character = character
    }    
}
