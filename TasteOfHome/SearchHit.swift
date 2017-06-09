//
//  SearchHit.swift
//  TasteOfHome
//
//  Created by Fan Chen on 6/8/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import Foundation

struct SearchHit {
  
  var description: String
  var distance: Double
  var searchHitId: String
  struct Location {
    var locationId: String
    var lat: Double
    var long: Double
    var owner: String
  }
  var location: Location
  var name: String
  var photos: [String]
  var price: Double
  struct Seller {
    var sellerId: String
    var name: String
    var phone: String
  }
  var seller: Seller
  var searchHitType: String
}

extension SearchHit {
  
  func distanceFromYou() -> String {
    return "\(distance)" + " km from you"
  }
}
