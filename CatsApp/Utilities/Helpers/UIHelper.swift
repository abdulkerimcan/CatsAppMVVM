//
//  UIHelper.swift
//  CatsApp
//
//  Created by Abdulkerim Can on 5.09.2023.
//

import UIKit

enum UIHelper{
    static func createHomeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 20
        return layout
        
    }
}
