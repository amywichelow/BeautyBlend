//  CollectionViewCell.swift
//  Beauty Blend
//  Created by Amy Wichelow on 27/02/2018.
//  Copyright © 2018 Amy Wichelow. All rights reserved.

import Foundation
import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var pinImage: UIImageView!
    @IBOutlet weak var difficultyImageView: UIImageView!
    
    
    override func prepareForReuse() {
        title.text = nil
        title.alpha = 0 
    }
 
    func animate() {
        UIView.animate(withDuration: 4.0) {
            self.title.alpha = 1.0
        }
    }
    
}
