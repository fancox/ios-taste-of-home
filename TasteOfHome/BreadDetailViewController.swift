//
//  BreadDetailViewController.swift
//  TasteOfHome
//
//  Created by Fan Chen on 2/20/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class BreadDetailViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var breadTitle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    lazy var ref: FIRDatabaseReference = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chalol bread"
        setUpStackView()
        setUpHeroImageView()
        setUpBreadTitle()
        setUpSubtitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setUpStackView() {
        stackView.spacing = 10
    }
    
    private func setUpHeroImageView() {
        heroImageView.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/noms-51115.appspot.com/o/food%2Ftest.png?alt=media&token=03ac2ed6-793a-448a-92db-194fdfedf30e"))
        heroImageView.contentMode = .scaleAspectFill
    }
    
    private func setUpBreadTitle() {
        breadTitle.text = "Challah bread"
    }
    
    private func setUpSubtitle() {
        subtitle.text = "Made by Fan Chen, $10"
    }
    
    // example for firebase network request
    private func loadDataFromFirebase() {
        let foodTypesRef = ref.child("food").child("1")
        // [START post_value_event_listener]
        foodTypesRef.observe(FIRDataEventType.value, with: { (snapshot) in
            let _ = snapshot.value as? [String : AnyObject] ?? [:]
            // [START_EXCLUDE]
            
            // [END_EXCLUDE]
        })
        // [END post_value_event_listener]
    }
}
