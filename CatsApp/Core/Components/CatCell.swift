//
//  CatCell.swift
//  CatsApp
//
//  Created by Abdulkerim Can on 5.09.2023.
//

import UIKit


final class CatCell: UICollectionViewCell {
    static let identifier = "CatCell"
    private let padding = CGFloat.padding
    private var posterImage: PosterImageView!
    private var nameLabel: UILabel!
    private var descLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureImageView()
        configureNameLabel()
        configureDescLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("fatal error")
    }
    override func prepareForReuse() {
        posterImage.image = nil
        posterImage.cancelDownloading()
    }
    func setCell(cat: CatModel) {
        posterImage.downloadImage(cat: cat)
        nameLabel.text = cat._name
        descLabel.text = cat._description
    }
    private func configureCell() {
        backgroundColor = .systemGray3
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    private func configureImageView() {
        posterImage = PosterImageView(frame: .zero)
        addSubview(posterImage)
        posterImage.clipsToBounds = true
        
        let posterWidth = CGFloat.dWidth
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: self.topAnchor),
            posterImage.widthAnchor.constraint(equalToConstant: posterWidth),
            posterImage.heightAnchor.constraint(equalToConstant: posterWidth)
        ])
    }
    private func configureNameLabel() {
        nameLabel = UILabel(frame: .zero)
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .boldSystemFont(ofSize: 26)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    private func configureDescLabel() {
        descLabel = UILabel(frame: .zero)
        addSubview(descLabel)
        descLabel.numberOfLines = 0
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            descLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            descLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding)
        ])
    }
}
