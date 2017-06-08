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
    loadData()
  }
  
  fileprivate var nearByResults = [SearchHit]()
  
  private func loadData() {
    
    let url = URL(string: "https://noms-search.stockwatcher.co/facetSearch?latitude=37&longitude=-122&distance=70")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      if let data = data,
        let json = try? JSONSerialization.jsonObject(with: data, options: []),
        let jsonDict = json as? [[String: Any]] {
        for value in jsonDict {
          let hit = SearchHit()
          if let photoArray = value["photos"] as? [String] {
            hit.imageURL = photoArray[1]
          }
          if let seller = value["seller"] as? [String : String],
            let title = seller["name"] {
            hit.chefTitle = title
          }
          hit.foodTitle = value["name"] as? String ?? ""
          if let distance = value["distance"] as? NSNumber {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 1
            hit.distance = formatter.string(from: distance) ?? "0"
          }
          self?.nearByResults.append(hit)
        }
      }
      
      self?.tableView.reloadData()
    }
    task.resume()
  }
}

// MARK: - UITableViewDataSource

extension BrowseViewController {
  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return nearByResults.count
  }
  
  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    guard let card = tableView.dequeueReusableCell(withIdentifier: String(describing: DisplayCard.self), for: indexPath) as? DisplayCard
//      else { return UITableViewCell() }
//    let row = indexPath.row
//    let result = nearByResults[row]
//    card.heroImageURLString = nearByResults[row].imageURL
//    card.titleLabel.text = result.displayCardTitle()
//    card.subtitleLabel.text = result.displayCardSubTitle()
//    card.styleCell()
//    return card
    let card = TallCard(searchHit: nearByResults[indexPath.row])
    return card
  }
  
  public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Near by"
  }
  
}

extension BrowseViewController {
  public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let controller = UIStoryboard(name: String(describing: BreadDetailViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: BreadDetailViewController.self)) as? BreadDetailViewController else { return }
    controller.searchHit = nearByResults[indexPath.row]
    navigationController?.pushViewController(controller, animated: true)
  }
}

class SearchHit {
  var imageURL: String = ""
  var chefTitle: String = ""
  var foodTitle: String = ""
  var distance: String = "0"
}

extension SearchHit {
  func displayCardTitle() -> String {
    return foodTitle + ", made by " + chefTitle
  }
  
  func displayCardSubTitle() -> String {
    return distance.description + " km away"
  }
}
