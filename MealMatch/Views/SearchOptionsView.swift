//
//  SearchOptionsView.swift
//  MealMatch
//
//  Created by Eric Weideman on 5/10/22.
//

import SwiftUI

struct SearchOptionsView: View {
    @EnvironmentObject var searchParameters: SearchParameters
    @State var searchTerm: String = ""
    
    var body: some View {
        ZStack{
            Text("Sample Text")
            TextField("Search Term", text: $searchTerm)
                .onChange(of: searchTerm) {
                    searchParameters.parameterList[.term] = $0
                    print(searchParameters.parameterList)
                }
            //ADD: Conditional String entry
            
            //ADD: Search radius. Max 4000
            
            //ADD: categories (picker)
                
            //ADD: Price
                
            //ADD: OpenNow
 
        }
    
    }
}

struct SearchOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchOptionsView()
    }
}

