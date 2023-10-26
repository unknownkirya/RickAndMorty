//
//  DetailViewModelProtocol.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 25.10.2023.
//

import Foundation
import UIKit

protocol DetailViewModelProtocol {
    var name: String { get }
    var imageUrl: UIImage { get }
    var status: String { get }
    var episodes: [String] { get }
    
    func numberOfSections() -> Int 
    func cellViewModel() -> InfoCellViewModelProtocol
}
