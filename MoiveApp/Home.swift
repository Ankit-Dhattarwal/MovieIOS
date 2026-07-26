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
        VStack{
            AsyncImage(url: URL(string: homeImageText)){
                image in image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
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

        }
    }
}

#Preview {
    Home()
}
