//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 18.10.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private lazy var collectionView = makeCollectionView()
    private var viewModel: MainViewModelProtocol? = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        setupView()
        setupCollectionView()
        createContraints()
        fetchViewModel()
    }
    
    private func setupView() {
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .blackBG
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        view.backgroundColor = .blackBG
    }
    
    private func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: 156, height: 202)
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        return collectionView
    }
    
    private func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .blackBG
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    private func createContraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(200)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-27)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    private func fetchViewModel() {
        guard let viewModel = viewModel else { return }
        viewModel.fetchCharacters {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel?.numberOfItems() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell
        guard var collectionCell = cell else { return UICollectionViewCell() }
        collectionCell.configure()
        let cellViewModel = viewModel?.cellViewModel(forIndexPath: indexPath)
        collectionCell.viewModel = cellViewModel
        
        return collectionCell
    }
}

