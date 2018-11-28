//
//  Cell.swift
//  collections
//
//  Created by Adriana González Martínez on 11/26/18.
//  Copyright © 2018 Adriana González Martínez. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    
    var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Layout views inside the cell
        
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        
        // Aplying constraints
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
            ])
        
        // Customization
        self.backgroundColor = UIColor.purple
        
        self.textLabel = textLabel

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
