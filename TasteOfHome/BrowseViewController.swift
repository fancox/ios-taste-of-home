//
//  BrowseViewController.swift
//  TasteOfHome
//
//  Created by Fan Chen on 2/12/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import UIKit

class BrowseViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Browse"
    }
    
    public var nearByResults: [SearchHit] = [
        SearchHit(imageName: "pusheen", chefTitle: "Fan Chen", foodTitle: "Chalolol bread", distance: 0.1)
    ]
}

// MARK: - UITableViewDataSource

extension BrowseViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearByResults.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let card = tableView.dequeueReusableCell(withIdentifier: String(describing: DisplayCard.self), for: indexPath) as? DisplayCard
            else { return UITableViewCell() }
        let row = indexPath.row
        let result = nearByResults[row]
        card.heroImageTitle = nearByResults[row].imageName
        card.titleLabel.text = result.displayCardTitle()
        card.subtitleLabel.text = result.displayCardSubTitle()
        return card
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Near by"
    }

}

struct SearchHit {
    var imageName: String
    var chefTitle: String
    var foodTitle: String
    var distance: Double
}

extension SearchHit {
    func displayCardTitle() -> String {
        return foodTitle + ", made by " + chefTitle
    }
    
    func displayCardSubTitle() -> String {
        return distance.description + "miles away"
    }
}
