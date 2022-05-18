//
//  NetworkLayer.swift
//  MealMatch
//
//  Created by Eric Weideman on 4/25/22.
//
import Foundation
import SwiftUI

class NetworkRequest {

    static func fetchYelpData(parameterString: String, completion: @escaping (BusinessData) -> Void) -> Void {
 
        // Defines the base address for the YELP API as a string, appends the search parameters, converts the address
        // to a URL object and unwraps the URL object.
        let urlString = "https://api.yelp.com/v3/businesses/search?\(parameterString)"
        print(urlString)
        let url = URL(string: urlString)
        guard let url = url else {
            print("fetchYelpData function failed to convert urlString to URL")
            return
        }
        
        // Generates a URLRequest object based on the URL Object.
        var request = URLRequest(url: url)
        
        // Establishes HTTPMethod. All calls to the Yelp API will be "get" requests so
        // this may be hard coded into the Network Layer
        request.httpMethod = "GET"
        
        // Sets the first header field as the Authorization Key for the Yelp API. Since all
        // content from the Yelp API will be JSON data, content is also set here.
        request.setValue("Bearer Flhq74g3gWo8-pLncKtV7VjcT8RpXXjG0fuN8dzn942Ltz_NmquOHGcyIGk2907Y9U8ydvIyKUOx5z6TfN59k2lPJ41GHE4UGeUQISr_U4mnFoDN4ZfGWymJmUtnYnYx", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, httpResponse, error in
            if let error = error {
                print("There has been an error with the YELP API fetch request")
                print(error)
                return
            }
            
            if let httpResponse = httpResponse as? HTTPURLResponse {
                print("Response HTTP Status code: \(httpResponse.statusCode)")
            }
            
            if let data = data {
                if let response = try? JSONDecoder().decode(BusinessData.self, from: data) {
                    print("API called and decoded some data")
                    completion(response)
                } else {
                    print("Invalid Response")
                }
               
                
                
            }
            
        }
        task.resume()
    }
}

