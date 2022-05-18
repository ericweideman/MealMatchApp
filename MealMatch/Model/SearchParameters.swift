//
//  SearchParameters.swift
//  MealMatch
//
//  Created by Eric Weideman on 4/29/22.
//

import Foundation
import SwiftUI

class SearchParameters: ObservableObject {

    var parameterList: [Parameter:String]
    var cateogries: Parameter = .categories
 
    
    init(){
        parameterList = [
            .categories : "dinner",
            .limit : "50",
            .price : "1,2,3,4"
        ]
    }
    
    func buildParameterString(userLatitude: Double, userLongitude: Double) -> String {

       
       //creates empty string which will be appended by this function and returned
       var parameterString = "latitude=\(userLatitude)&longitude=\(userLongitude)&"
       
       // Iterates through searchParameter dictionary and appends seach terms and assocated
       // values to the parameterString
       for (parameter, valStr) in parameterList {
           parameterString.append("\(parameter.rawValue)=\(valStr)&")
       }
       
       //removes trailing ampersand
       parameterString.remove(at: parameterString.index(before: parameterString.endIndex))
       
       return parameterString
   }
}

enum Parameter: String {
    case radius = "radius"  // Search radius for the results per Yelp API. Value is in km.
    case categories = "categories" // Search filter for food categories per Yelp API
    case limit = "limit" // Search result limit per the Yelp API
    case price = "price" // Search filter by price per Yelp API
    case open_now = "open_now" //Search filter by currently open now per Yelp API. Is a bool.
    case term = "term"
}
