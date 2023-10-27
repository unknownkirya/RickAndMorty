//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 20.10.2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var character: Character?
    
    private lazy var tableView = UITableView()
    private lazy var btnBack = crateBarButtonItem()
    private lazy var imgView = UIImageView()
    private lazy var lblTitle = UILabel()
    private lazy var lblStatus = UILabel()
    
    var viewModel: DetailViewModelProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewModel = viewModel else { return }
        
        lblTitle.text = viewModel.name
        imgView.image = viewModel.imageUrl
        lblStatus.text = viewModel.status
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    private func setupUI() {
        setupTableView()
        setupView()
        setuplbl()
        setupImgView()
        createContraints()
        fetchEpisodes()
    }
    
    private func setupView() {
        view.backgroundColor = .blackBG
        view.addSubview(tableView)
        view.addSubview(lblTitle)
        view.addSubview(imgView)
        view.addSubview(lblStatus)
        
        navigationItem.leftBarButtonItem = btnBack
    }
    
    private func crateBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "backBarButtonItem"), style: .plain, target: self, action: #selector(backButtonTapped))
    }
    
    private func setuplbl() {
        lblTitle.textColor = .white
        lblTitle.textAlignment = .center
        lblTitle.numberOfLines = 0
        lblTitle.adjustsFontSizeToFitWidth = true
        
        lblStatus.textColor = .green
        lblStatus.textAlignment = .center
        lblStatus.numberOfLines = 0
        lblStatus.adjustsFontSizeToFitWidth = true
    }
    
    private func setupImgView() {
        imgView.layer.cornerRadius = 10
        imgView.layer.masksToBounds = true
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .blackBG
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "InfoTableViewCell")
        tableView.register(OriginTableViewCell.self, forCellReuseIdentifier: "OriginTableViewCell")
        tableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: "EpisodesTableViewCell")
    }
    
    private func createContraints() {
        imgView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(150)
            make.leading.equalTo(view.snp.leading).offset(113)
            make.trailing.equalTo(view.snp.trailing).offset(-114)
            make.height.equalTo(160)
        }
        
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(24)
            make.leading.equalTo(view.snp.leading).offset(119)
            make.trailing.equalTo(view.snp.trailing).offset(-118)
            make.height.equalTo(25)
        }
        
        lblStatus.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(8)
            make.leading.equalTo(view.snp.leading).offset(170)
            make.trailing.equalTo(view.snp.trailing).offset(-171)
            make.height.equalTo(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(lblStatus.snp.bottom).offset(24)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    private func fetchEpisodes() {
        guard let viewModel = viewModel else { return }
        viewModel.fetchEpisode() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return viewModel?.numberOfRowsInSection() ?? 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell
            guard let tblViewCell = cell else { return UITableViewCell() }
            
            let cellViewModel = viewModel?.cellInfoViewModel()
            tblViewCell.configure()
            tblViewCell.viewModel = cellViewModel
            return tblViewCell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OriginTableViewCell", for: indexPath) as? OriginTableViewCell
            guard let tblViewCell = cell else { return UITableViewCell() }
            
            let cellViewModel = viewModel?.cellOriginViewModel()
            tblViewCell.configure()
            tblViewCell.viewModel = cellViewModel
            return tblViewCell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodesTableViewCell", for: indexPath) as? EpisodesTableViewCell
            guard let tblViewCell = cell else { return UITableViewCell() }
            let cellViewModel = viewModel?.cellEpisodeViewModel(indexPath: indexPath)
            tblViewCell.configure()
            tblViewCell.viewModel = cellViewModel
            return tblViewCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 124
        } else if indexPath.section == 1 {
            return 80
        } else if indexPath.section == 2 {
            return 86
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Info"
        case 1: return "Origin"
        case 2: return "Episodes"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        
        headerView.textLabel?.numberOfLines = 0
        headerView.textLabel?.adjustsFontSizeToFitWidth = true
        headerView.textLabel?.textColor = UIColor.white
        headerView.backgroundColor = .clear
    }
}
