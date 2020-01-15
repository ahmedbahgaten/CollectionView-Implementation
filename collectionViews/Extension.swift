//
//  Extension.swift
//  collectionViews
//
//  Created by AHMED on 1/14/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
import UIKit
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       collectionData.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
       cell.titleLabel.text = collectionData[indexPath.row]
       cell.isEditing = isEditing
    cell.layer.cornerRadius = cell.layer.frame.size.width/2
    cell.layer.masksToBounds = true
    
    
       return cell
   }
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let text = collectionData[indexPath.row]
       if !isEditing{
           print(text)
       performSegue(withIdentifier: "detailSegue", sender: indexPath)
   }
       else {
        navigationController?.isToolbarHidden = false
    }
   }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if isEditing {
            if let selected = collectionView.indexPathsForSelectedItems,  selected.count == 0 {
                navigationController?.isToolbarHidden = true
            }
        }
    }
   

   }

