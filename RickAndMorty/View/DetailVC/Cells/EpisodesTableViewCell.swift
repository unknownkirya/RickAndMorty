//
//  EpisodesTableViewCell.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 25.10.2023.
//

import UIKit
import SnapKit

class EpisodesTableViewCell: UITableViewCell {

    private lazy var lblTitle = UILabel()
    private lazy var lblEpisode = UILabel()
    private lazy var lblDate = UILabel()
    
    var viewModel: EpisodesCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            lblTitle.text = viewModel.title
            lblEpisode.text = "Episode: \(viewModel.episodeNumber ?? ""), Season: \(viewModel.seasonNumber ?? "")"
            lblDate.text = viewModel.date
        }
    }
    
    func configure() {
        setupUI()
        createConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .grayForCell
        self.layer.cornerRadius = 10
        self.isUserInteractionEnabled = false
        
        setupLabels()
        
        addSubview(lblTitle)
        addSubview(lblEpisode)
        addSubview(lblDate)
    }
    
    private func setupLabels() {
        lblTitle.textColor = .white
        lblTitle.font = lblTitle.font.withSize(17)
        lblTitle.numberOfLines = 0
        lblTitle.adjustsFontSizeToFitWidth = true
        
        lblEpisode.textColor = .green
        lblEpisode.font = lblEpisode.font.withSize(13)
        lblEpisode.numberOfLines = 0
        lblEpisode.adjustsFontSizeToFitWidth = true
        
        lblDate.textColor = .gray
        lblDate.font = lblDate.font.withSize(12)
        lblDate.numberOfLines = 0
        lblDate.adjustsFontSizeToFitWidth = true
    }
    
    private func createConstraints() {
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.width.equalTo(250)
            make.height.equalTo(22)
        }
        lblEpisode.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.width.equalTo(121)
            make.bottom.equalTo(self.snp.bottom).offset(-14)
        }
        lblDate.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.width.equalTo(102)
            make.bottom.equalTo(self.snp.bottom).offset(-14)
        }
    }
}
