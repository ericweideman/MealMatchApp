//
//  BottomTabView.swift
//  MealMatch
//
//  Created by Eric Weideman on 5/10/22.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
        TabView{
        MealSwipeView()
                .tabItem {
                    Label("Swipe", systemImage: "m.square")
                        .foregroundColor(.white)
                }
            
        HomepageView()
                .tabItem {
                    Label("Home", systemImage: "house")
                        .foregroundColor(.white)
                }
            
        SearchOptionsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                        .foregroundColor(.white)
                }
        }
        .background(Color.gray)
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
            .environmentObject(BusinessData())
    }
}
