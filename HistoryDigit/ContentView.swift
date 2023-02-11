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
//            SearchView(text: .constant(""))
            NumberView()
                .tabItem {
                    Label("Search", systemImage: "bonjour")
                }
                .tag(0)
            StatisticView()
                .tabItem{
                    Label("Statistic", systemImage: "list.number")
                }
                .tag(1)
            CabinetView()
                .tabItem{
                    Label("My Numbers", systemImage: "person.fill")
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

