//
//  ContentView.swift
//  MoiveApp
//
//  Created by Ankit on 26/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab(Constants.homeString, systemImage: Constants.homeIconString){
                Home()
            }
            Tab(Constants.UpcomingString, systemImage: Constants.UpcomingIconString){
                Text("Upcoming")
            }
            Tab(Constants.searchString, systemImage: Constants.searchIconString){
                Text("Search")
            }
            Tab(Constants.downloadString, systemImage: Constants.downloadIconString){
                Text("Download")
            }
        }
    }
}

#Preview {
    ContentView()
}
