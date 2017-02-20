//
//  BreadDetailViewController.swift
//  TasteOfHome
//
//  Created by Fan Chen on 2/20/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import UIKit

class BreadDetailViewController: UIViewController {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var breadTitle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chalol bread"
    }
}
