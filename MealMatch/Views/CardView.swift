//
//  CardView.swift
//  MealMatch
//
//  Created by Eric Weideman on 5/9/22.
//

import SwiftUI

struct CardView: View {
    let business: Business
    
    var body: some View {
        ZStack{
            BackgroundImageView
            HStack{
                Spacer()
                VStack{
                    VStack(alignment: .leading){
                        RestaurantName
                        RatingsAndReviews
                        Attributes
                    }
                    Spacer()
                    VStack(alignment: .center){
                        MorePhotosButton
                        YelpTag
                    }
                }
                Spacer()
            }
        }
    }

        
    
    var BackgroundImageView: some View{ 
        AsyncImage(url: URL(string: business.image_url)){ image in
            image.resizable()
            image.scaledToFit()
            
        } placeholder: {
            ProgressView()
        }
        .frame(width: 380, height: 600)
        .shadow(color: .gray, radius: 15)
        .mask(LinearGradient(gradient: Gradient(colors: [.clear, .white, .white, .clear]), startPoint: .bottom, endPoint: .top))
        .background(.black)
    }
    
    var RestaurantName: some View {
        Text(business.name)
            .font(.custom("AvenirNext-Heavy", size: 32))
            .shadow(color: .gray, radius: 5)
            .foregroundColor(.white)
            .padding(.top, 50)
            .multilineTextAlignment(.center)
    }
    
    var RatingsAndReviews: some View {
        HStack{
            Image("\(business.rating)")
            Text("\(business.review_count) reviews")
                .foregroundColor(.white)
        }
    }
    
    var Attributes: some View {
        Text("\(business.categories[0].title) • \(business.price)")
            .font(.custom("AvenirNext-Heavy", size: 16))
            .foregroundColor(.white)
            .padding(.top, 5)
    }
    
    var MorePhotosButton: some View {
        Button(action: {
            print("Rounded Button")
        }, label: {
            Text("Show More Photos")
                .shadow(color: .gray, radius: 5)
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 4)
                        .foregroundColor(.white)
                )
        })
    }
    
    var YelpTag: some View {
        
        HStack{
            Text("Powered by")
                .font(.custom("AvenirNext-Heavy", size: 16))
                .foregroundColor(.white)
                .padding(.top, 5)
            Image("YelpLogo")
                .resizable()
                .frame(width: 48, height: 16)
                .scaledToFit()
                .padding(5)
                .background(.white)
                .cornerRadius(5)
        }
        .padding(.bottom, 20)
    }
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
            CardView(business: BusinessData().businesses[0])
            .previewLayout(.fixed(width: 380, height: 600))
    }
}
