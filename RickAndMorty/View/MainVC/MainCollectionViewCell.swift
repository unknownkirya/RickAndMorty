//
//  MainCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 18.10.2023.
//

import UIKit
import SnapKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    private lazy var lblTitle = UILabel()
    private lazy var imgView = UIImageView()
    
    weak var viewModel: CollectionViewCellVMProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            lblTitle.text = viewModel.name
            imgView.image = viewModel.imageUrl
        }
    }
    
    func configure() {
        setupUI()
    }
    
    private func setupUI() {
        
        self.backgroundColor = .grayForCell
        self.layer.cornerRadius = 15
        
        imgView.layer.cornerRadius = 10
        imgView.layer.masksToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        lblTitle.textColor = .white
        lblTitle.textAlignment = .center
        lblTitle.numberOfLines = 0
        lblTitle.adjustsFontSizeToFitWidth = true
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(lblTitle)
        addSubview(imgView)
        createConstraints()
    }
    
    
    private func createConstraints() {
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(164)
            make.leading.equalTo(self.snp.leading).offset(29)
            make.trailing.equalTo(self.snp.trailing).offset(-28)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
        }
        
        imgView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(8)
            make.leading.equalTo(self.snp.leading).offset(8)
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.bottom.equalTo(self.snp.bottom).offset(-54)
        }
    }
    
}
