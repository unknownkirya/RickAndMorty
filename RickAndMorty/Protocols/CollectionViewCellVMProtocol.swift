//
//  CollectionViewCellVMProtocol.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 20.10.2023.
//

import Foundation
import UIKit

protocol CollectionViewCellVMProtocol: AnyObject {
    var name: String { get }
    var imageUrl: UIImage { get }
}
