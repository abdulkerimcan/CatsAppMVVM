//
//  PosterImageView.swift
//  CatsApp
//
//  Created by Abdulkerim Can on 5.09.2023.
//

import UIKit

final class PosterImageView: UIImageView {
    private var dataTask: URLSessionTask?

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(cat: CatModel) {
        guard let url = URL(string: AppConstants.imageUrl(id: cat._referenceImageId)) else {
            return
        }
        dataTask = NetworkManager.shared.download(url: url, completion: { result in
            switch result {
            case .failure(_):
                break
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        })
        dataTask?.resume()
    }
    
    func cancelDownloading() {
        dataTask?.cancel()
        dataTask = nil
    }
    
}
