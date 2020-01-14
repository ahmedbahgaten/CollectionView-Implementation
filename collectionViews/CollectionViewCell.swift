//
//  CollectionViewCell.swift
//  collectionViews
//
//  Created by AHMED on 1/14/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var selectionImage:UIImageView!
    
    var isEditing :Bool = false {
        didSet {
            selectionImage.isHidden = !isEditing
        }
    }
    override var isSelected: Bool {
        didSet {
            if isEditing {
                selectionImage.image = isSelected ? UIImage(named: "Graphicloads-100-Flat-2-Check-1") : UIImage(named: "12090335861556281944-512")
            }
        }
    }
    
}
