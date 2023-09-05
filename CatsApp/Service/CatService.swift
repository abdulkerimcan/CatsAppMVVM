//
//  CatService.swift
//  CatsApp
//
//  Created by Abdulkerim Can on 4.09.2023.
//

import Foundation

final class CatService {
    
    func downloadCat(completion: @escaping ([CatModel]?) -> ()) {
        guard let url = URL(string: AppConstants.url()) else {
            return
        }
        NetworkManager.shared.download(url: url) { result in
            switch result {
            case .failure(let error):
                self.handleWithError(error)
            case .success(let data):
                completion(self.handleWithData(data))
            }
        }
    }
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [CatModel]? {
        do {
            let cat = try JSONDecoder().decode([CatModel].self, from: data)
            return cat
        } catch {
            handleWithError(error)
        }
        return nil
    }
}
