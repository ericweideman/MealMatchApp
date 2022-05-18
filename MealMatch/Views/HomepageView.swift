//
//  ContentView.swift
//  MealMatch
//
//  Created by Eric Weideman on 4/25/22.
//

import SwiftUI

struct HomepageView: View {
    
    @StateObject var locationManager = LocationManager()
    @StateObject var businessData = BusinessData()
    @StateObject var searchParameters = SearchParameters()
    @State private var selection: String? = nil
    
    
    var body: some View {
            NavigationView{
                ZStack{
                    Color.black
                        .ignoresSafeArea()
                        
                VStack{
                    Spacer()
                    Text("Meal Match App!")
                        .font(.custom("AvenirNext-Heavy", size: 32))
                        .shadow(color: .gray, radius: 5)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                    
                    Spacer()
                    NavigationLink(destination: MealSwipeView(), tag: "MealSwipeView", selection: $selection){
                        EmptyView()
                    }
                    
                    Button("Lets Get Started"){
                        let parameterString = searchParameters.buildParameterString(userLatitude: locationManager.userLatitude, userLongitude: locationManager.userLongitude)
                        NetworkRequest.fetchYelpData(parameterString: parameterString) { response in
                            print(response.businesses.count)
                            self.businessData.businesses = response.businesses
                            print(businessData.businesses.count)
                            self.selection = "MealSwipeView"
                        }
                    }
                    Spacer()
                }
                }
                
                
            }
            .environmentObject(locationManager)
            .environmentObject(businessData)
            .environmentObject(searchParameters)
    }
    
}



struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
