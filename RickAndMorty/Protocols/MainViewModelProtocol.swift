//
//  MainViewModelProtocol.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 20.10.2023.
//

import Foundation

protocol MainViewModelProtocol {
    func numberOfItems() -> Int
    func fetchCharacters(completion: @escaping() -> ())
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellVMProtocol?    
    func viewModelForSelectedRow() -> DetailViewModelProtocol?
    func selectedItem(atIndexPath indexPath: IndexPath)
}
