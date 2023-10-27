//
//  InfoTableViewCell.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 25.10.2023.
//

import UIKit
import SnapKit

class InfoTableViewCell: UITableViewCell {
    
    private lazy var lblSpeciesCharacter = UILabel()
    private lazy var lblTypeCharacter = UILabel()
    private lazy var lblGenderCharacter = UILabel()
    
    var viewModel: InfoCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            lblSpeciesCharacter.text = viewModel.species
            lblTypeCharacter.text = viewModel.type
            lblGenderCharacter.text = viewModel.gender
        }
    }
    
    private var lblSpecies: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.text = "Species:"
        return lbl
    }()
    private var lblType: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.text = "Type:"
        return lbl
    }()
    private var lblGender: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.text = "Gender:"
        return lbl
    }()
    
    func configure() {
        setupUI()
        createConstraints()
    }
    
    private func setupUI() {
        
        self.backgroundColor = .grayForCell
        self.layer.cornerRadius = 10
        
        setupLabels()
        
        addSubview(lblSpeciesCharacter)
        addSubview(lblTypeCharacter)
        addSubview(lblGenderCharacter)
        
        self.addSubview(lblSpecies)
        addSubview(lblType)
        addSubview(lblGender)
    }
    
    private func setupLabels() {
        lblSpeciesCharacter.textColor = .white
        lblSpeciesCharacter.textAlignment = .center
        lblSpeciesCharacter.numberOfLines = 0
        lblSpeciesCharacter.adjustsFontSizeToFitWidth = true
        
        lblTypeCharacter.textColor = .white
        lblTypeCharacter.textAlignment = .center
        lblTypeCharacter.numberOfLines = 0
        lblTypeCharacter.adjustsFontSizeToFitWidth = true
        
        lblGenderCharacter.textColor = .white
        lblGenderCharacter.textAlignment = .center
        lblGenderCharacter.numberOfLines = 0
        lblGenderCharacter.adjustsFontSizeToFitWidth = true
    }
    
    private func createConstraints() {
        lblSpecies.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-246)
            make.bottom.equalTo(self.snp.bottom).offset(-88)
        }
        lblType.snp.makeConstraints { make in
            make.top.equalTo(lblSpecies.snp.bottom).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-246)
            make.height.equalTo(20)
        }
        lblGender.snp.makeConstraints { make in
            make.top.equalTo(lblType.snp.bottom).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-246)
            make.height.equalTo(20)
        }
        
        lblSpeciesCharacter.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(259)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.bottom.equalTo(self.snp.bottom).offset(-88)
        }
        lblTypeCharacter.snp.makeConstraints { make in
            make.top.equalTo(lblSpeciesCharacter.snp.bottom).offset(16)
            make.leading.equalTo(self.snp.leading).offset(259)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.height.equalTo(20)
        }
        lblGenderCharacter.snp.makeConstraints { make in
            make.top.equalTo(lblTypeCharacter.snp.bottom).offset(16)
            make.leading.equalTo(self.snp.leading).offset(259)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.height.equalTo(20)
        }
    }
}
