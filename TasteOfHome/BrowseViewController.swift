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
        let jsonDict = json as? [String: Any] {
        for (_, value) in jsonDict {
          let hit = SearchHit()
          if let parsedValue = value as? [String: Any] {
            if let photoArray = parsedValue["photos"] as? [String] {
              hit.imageURL = photoArray[1]
            }
            hit.chefTitle = parsedValue["seller"] as? String ?? ""
            hit.foodTitle = parsedValue["name"] as? String ?? ""
            hit.distance = 1.2 //TODO need this
          }
          self?.nearByResults.append(hit)
        }
        self?.tableView.reloadData()
      }
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
    guard let card = tableView.dequeueReusableCell(withIdentifier: String(describing: DisplayCard.self), for: indexPath) as? DisplayCard
      else { return UITableViewCell() }
    let row = indexPath.row
    let result = nearByResults[row]
    card.heroImageURLString = nearByResults[row].imageURL
    card.titleLabel.text = result.displayCardTitle()
    card.subtitleLabel.text = result.displayCardSubTitle()
    card.styleCell()
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
  var distance: Double = 0
}

extension SearchHit {
  func displayCardTitle() -> String {
    return foodTitle + ", made by " + chefTitle
  }
  
  func displayCardSubTitle() -> String {
    return distance.description + "miles away"
  }
}
