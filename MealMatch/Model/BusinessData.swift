//
//  SessionDetails.swift
//  MealMatch
//
//  Created by Eric Weideman on 4/25/22.
//

import Foundation
import UIKit
import SwiftUI


class BusinessData: NSObject, Codable, ObservableObject {
    
    var businesses: [Business] = [Business(id: "nbVuB52f__aBC6WwmgGSsA", name: "Dos De Oros", alias: "dos-de-oros-kansas-city", is_closed: false, rating: 5.0, review_count: 256, url: "https://www.yelp.com/biz/dos-de-oros-kansas-city?adjust_creative=GbfhmvUavrueIu8KbtPLKQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=GbfhmvUavrueIu8KbtPLKQ", price: "$$", coordinates: ["latitude": 38.8909988,"longitude": -94.5857549], categories: [Category(alias: "mexican", title: "Mexican")], image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/5B2Ls6Wg6JdCQ7aIc-F1kg/o.jpg", photos: nil)]
        
}

class Business: Codable {
    let id: String
    let name: String
    let alias: String
    let is_closed: Bool
    var rating: Double
    let review_count: Int
    let url: String
    let price: String
    let coordinates: [String:Double]
    let categories: [Category]
    let image_url: String
    let photos: [String]?
    
    init(id: String, name: String, alias: String, is_closed: Bool, rating: Double, review_count: Int, url: String, price: String,  coordinates: [String:Double], categories: [Category], image_url: String, photos: [String]?){
        self.id = id
        self.name = name
        self.alias = alias
        self.is_closed = is_closed
        self.rating = rating
        self.review_count = review_count
        self.url = url
        self.price = price
        self.coordinates = coordinates
        self.categories = categories
        self.image_url = image_url
        self.photos = photos
        
    }
}

struct Category: Codable {
    let alias: String
    let title: String
    
    init(alias: String, title: String){
        self.alias = alias
        self.title = title
    }
}

extension Business: CustomStringConvertible {
    var description: String {
        let formattedValue = String(format: "%.1f", rating)
        return "\(formattedValue)"
    }
    
    
    
    
}

