//
//  BreadDetailViewController.swift
//  TasteOfHome
//
//  Created by Fan Chen on 2/20/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import UIKit
import Firebase

class BreadDetailViewController: UIViewController {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var breadTitle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    lazy var ref: FIRDatabaseReference = FIRDatabase.database().reference()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chalol bread"
        let foodTypesRef = ref.child("food").child("1")
        // [START post_value_event_listener]
        foodTypesRef.observe(FIRDataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            // [START_EXCLUDE]
            
            // [END_EXCLUDE]
        })
        // [END post_value_event_listener]
    }
}
