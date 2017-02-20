//
//  SignInViewController.swift
//  TasteOfHome
//
//  Created by Fan Chen on 2/20/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var browseAsGuestButton: UIButton!
    
    @IBAction func didTapBrowseAsGuestButton(_ sender: Any) {
        // Firebase auth
        FIRAuth.auth()?.signInAnonymously(completion: { (firUser, error) in
            print(firUser)
            print(error)
            // do nothing
        })
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarController")
        show(controller, sender: nil)
    }
}
