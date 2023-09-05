//
//  HomeScreenViewModel.swift
//  CatsApp
//
//  Created by Abdulkerim Can on 4.09.2023.
//

import Foundation

protocol HomeViewModelDelegate {
    var view: HomeScreenDelegate? {get set}
    func viewDidLoad()
    func getCats()
}

final class HomeViewModel {
    weak var view: HomeScreenDelegate?
    private let service = CatService()
    var cats: [CatModel] = []
    
}

extension HomeViewModel: HomeViewModelDelegate {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getCats()
    }
    
    func getCats() {
        service.downloadCat { [weak self] cats in
            guard let self = self else {
                return
            }
            guard let cats = cats else {return}
            self.cats.append(contentsOf: cats)            
            self.view?.reloadCollectionView()
        }
    }
}
