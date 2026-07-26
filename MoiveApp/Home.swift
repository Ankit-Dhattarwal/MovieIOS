//
//  Home.swift
//  MoiveApp
//
//  Created by Ankit on 26/07/26.
//

import SwiftUI

struct Home: View {
    var homeImageText = Constants.testTitleUrl
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVStack{
                    AsyncImage(url: URL(string: homeImageText)){
                        image in image.resizable().scaledToFit()
                            .overlay{
                                LinearGradient(
                                stops: [Gradient.Stop(color: .clear, location: 0.8), Gradient.Stop(color: .gradient, location: 1)],
                                startPoint: .top,
                                endPoint: .bottom)
                            }
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.85)
                    
                    HStack{
                        Button{
                            
                        }label: {
                            Text(Constants.playString)
                                .OutlineButtonStyle()
                        }
                        Button{
                            
                        }label: {
                            Text(Constants.downloadString)
                                .OutlineButtonStyle()
                        }
                    }
                    
                    HorizontalListView(header: Constants.trendingMovieString)
                    HorizontalListView(header: Constants.trendingTVString)
                    HorizontalListView(header: Constants.topRatedMovieString)
                    HorizontalListView(header: Constants.topRatedTVString)
                }
            }
        }
    }
}

#Preview {
    Home()
}
