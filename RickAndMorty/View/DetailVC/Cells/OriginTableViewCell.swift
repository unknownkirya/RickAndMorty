//
//  OriginTableViewCell.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 25.10.2023.
//

import UIKit
import SnapKit

class OriginTableViewCell: UITableViewCell {
    
    private lazy var imgBackground = UIView()
    private lazy var lblNameOfPlanet = UILabel()
    private lazy var lblDescription = UILabel()
    private lazy var imgPlanet = UIImageView()
    
    var viewModel: OriginCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            lblNameOfPlanet.text = viewModel.locationName
            lblDescription.text = "Planet"
            imgPlanet.image = UIImage(named: "planet")
        }
    }
    
    func configure() {
        setupUI()
        createConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .grayForCell
        self.layer.cornerRadius = 10
        
        setupLabels()
        
        addSubview(imgBackground)
        addSubview(lblNameOfPlanet)
        addSubview(lblDescription)
        
        imgBackground.backgroundColor = .blackBG
        imgBackground.layer.cornerRadius = 10
        imgBackground.addSubview(imgPlanet)
    }
    
    private func setupLabels() {
        lblNameOfPlanet.font = lblNameOfPlanet.font.withSize(17)
        lblNameOfPlanet.textColor = .white
        lblNameOfPlanet.numberOfLines = 0
        lblNameOfPlanet.adjustsFontSizeToFitWidth = true
        
        lblDescription.font = lblNameOfPlanet.font.withSize(13)
        lblDescription.textColor = .green
        lblDescription.numberOfLines = 0
        lblDescription.adjustsFontSizeToFitWidth = true
    }
    
    private func createConstraints() {
        imgBackground.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(8)
            make.leading.equalTo(self.snp.leading).offset(8)
            make.width.equalTo(64)
            make.height.equalTo(64)
        }
        
        imgPlanet.snp.makeConstraints { make in
            make.top.equalTo(imgBackground.snp.top).offset(20)
            make.leading.equalTo(imgBackground.snp.leading).offset(20)
            make.trailing.equalTo(imgBackground.snp.trailing).offset(-20)
            make.bottom.equalTo(imgBackground.snp.bottom).offset(-20)
        }
        
        lblNameOfPlanet.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(imgBackground.snp.trailing).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-150)
            make.height.equalTo(22)
        }
        lblDescription.snp.makeConstraints { make in
            make.top.equalTo(lblNameOfPlanet.snp.bottom).offset(8)
            make.leading.equalTo(imgBackground.snp.trailing).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-201)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
        }
        
    }
}
