//
//  CustomFlowLayout.swift
//  collections
//
//  Created by Adriana González Martínez on 11/26/18.
//  Copyright © 2018 Adriana González Martínez. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        // when rotation happens
        super.prepare()
        guard let cv = collectionView else { return }
        
        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        let minColumnWidth = CGFloat(300)
        let maxNumColumns = Int(availableWidth/minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: 70.0)
        
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.sectionInsetReference = .fromSafeArea
    }
    

}
