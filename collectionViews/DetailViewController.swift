//
//  DetailViewController.swift
//  collectionViews
//
//  Created by AHMED on 1/14/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selection:String!

    @IBOutlet private weak var label:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = selection
    }

  
    }
 
