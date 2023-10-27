//
//  MainVIewModel.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 18.10.2023.
//

import Foundation
import UIKit

final class MainViewModel: MainViewModelProtocol {
    
    private var selectedIndexPath: IndexPath?
    
    private let networkService = NetworkService()
    private var characters: [Character.Result]?
    
    func fetchCharacters(completion: @escaping() -> ()) {
        networkService.fetchCharacter { [weak self] characters in
            self?.characters = characters
            completion()
        }
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellVMProtocol? {
        guard let characters = characters else { return nil }
        let character = characters[indexPath.row]
        return CollectionVIewCellVM(character: character)
    }
    
    func numberOfItems() -> Int {
        return self.characters?.count ?? 0
    }
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol? {
        guard let characters = characters else { return nil }
        return DetailViewModel(character: (characters[selectedIndexPath?.row ?? 0]))
    }
    
    func selectedItem(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
