//
//  HomeScreen.swift
//  CatsApp
//
//  Created by Abdulkerim Can on 4.09.2023.
//

import UIKit

protocol HomeScreenDelegate: AnyObject{
    func configureVC()
    func configureCollectionView()
    func reloadCollectionView()
}

final class HomeScreen: UIViewController {
    private let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()

    }
}

extension HomeScreen: HomeScreenDelegate {
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Cats App 🐱"
        
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: UIHelper.createHomeLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CatCell.self, forCellWithReuseIdentifier: CatCell.identifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCell.identifier, for: indexPath) as! CatCell
        cell.setCell(cat: viewModel.cats[indexPath.item])
        return cell
    }
    
    
}
