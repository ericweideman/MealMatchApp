//
//  Meal Swipe.swift
//  MealMatch
//
//  Created by Eric Weideman on 4/25/22.
//

import SwiftUI

struct MealSwipeView: View {
    
    @StateObject var sessionData = SessionData()
    @EnvironmentObject var businessData: BusinessData
    @State private var index = 0
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                CardView(business: businessData.businesses[index])
                    .frame(width: 380, height: 600, alignment: .center)
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(color: .gray, radius:5)
               //     .offset(x: 0, y: )
                Button("Next"){
                    index = index + 1
                }
            }
        }
        
//        if businessData.businesses.isEmpty || businessData.businesses.count <= index - 1{
//            Text("No Restaurants left to swipe")
//        } else{
//            VStack{
//                CardView(business: businessData.businesses[index])
//                    .scaledToFit()
//                Spacer()
//               r HStack{
//                    Spacer()
//                    Button("Nasty"){
//                        index = index + 1
//                    }
//                    Spacer()
//                    Button("Sounds Good"){
//                        sessionData.approvedRestaurants.append(businessData.businesses[index])
//                        index = index + 1
//                    }
//                    Spacer()
//                }
//                Spacer()
//                Button("Print Approved List"){
//                    for business in sessionData.approvedRestaurants {
//                        print("\(business.alias)")
//                    }
//                }
//            }
//        }
    }
}

struct MealSwipeView_Previews: PreviewProvider {
    
    static var previews: some View {
        MealSwipeView()
            .environmentObject(BusinessData())
    }
}
