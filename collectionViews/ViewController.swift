//
//  ViewController.swift
//  collectionViews
//
//  Created by AHMED on 1/14/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:-Variables
    var collectionData = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    //MARK:-Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addbutton :UIBarButtonItem!
    @IBOutlet weak var deleteButton:UIBarButtonItem!
    //MARK:-Actions
    @IBAction func addButton() {
        let text = "\(collectionData.count + 1 )"
        collectionData.append(text)
        let indexPath = IndexPath(row: collectionData.count - 1  , section: 0)
        collectionView.insertItems(at: [indexPath])
    }
    @IBAction func deleteButtonSelected () {
        if let selected = collectionView.indexPathsForSelectedItems {
            let items = selected.map { $0.item }.sorted().reversed()
            for item in items {
                collectionData.remove(at:item)
            }
            collectionView.deleteItems(at: selected)
            navigationController?.isToolbarHidden = true
        }
    }
    //MARK:-ViewDidLoad
    override func viewDidLoad() {
           super.viewDidLoad()
           setCellSize()
           setRefresher()
           navigationController?.isToolbarHidden = true
       }
    //MARK:-functions
    func setRefresher() {
        let Refresh = UIRefreshControl()
        Refresh.tintColor = .white
        Refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        collectionView.refreshControl = Refresh
        navigationItem.leftBarButtonItem = editButtonItem
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        addbutton.isEnabled = !editing
        collectionView.allowsMultipleSelection = editing
        collectionView.indexPathsForSelectedItems?.forEach({ (indexPath) in
            collectionView.deselectItem(at: indexPath, animated: false)
        })
        let indexPaths = collectionView.indexPathsForVisibleItems
        for indexPath in indexPaths {
            let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
            cell.isEditing = editing
        }
        deleteButton.isEnabled = isEditing
        if !editing {
        navigationController?.isToolbarHidden = true
    }
    }
    func setCellSize() {
        let width = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
        @objc func refresh() {
            addButton()
            collectionView.refreshControl?.endRefreshing()
        }
    
//MARK:-Segue for data transfer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "detailSegue" {
               
           if let dest = segue.destination as? DetailViewController{
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else {return}
            dest.selection = collectionData[indexPath.row]
           }
       }
    }
}
