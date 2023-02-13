//
//  ContentView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 07.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelected: Int = 0

    var body: some View {
        TabView(selection: $tabSelected){
            SearchView()
//            NumberView()
                .tabItem {
                    Label("Search", systemImage: "bonjour")
                }
                .tag(0)
            CabinetView()
                .tabItem{
                    Label("Cabinet", systemImage: "person.fill")
                }
                .tag(1)
            AboutMeView()
                .tabItem{
                    Label("About dev", systemImage: "desktopcomputer")
                }
                .tag(2)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

