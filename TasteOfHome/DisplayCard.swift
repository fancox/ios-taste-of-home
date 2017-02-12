//
//  DisplayCard.swift
//  TasteOfHome
//
//  Created by Fan Chen on 2/12/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import UIKit

class DisplayCard: UITableViewCell {
    
    // MARK: Public

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    public var heroImageTitle: String = "" {
        didSet {
            updateHeroImageView()
        }
    }

    private func updateHeroImageView() {
        heroImageView.image = UIImage(named: heroImageTitle)
    }
}
