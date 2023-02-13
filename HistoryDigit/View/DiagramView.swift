//
//  DiagramView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 11.02.2023.
//

import SwiftUI
import Charts

struct ValuePerCategory {
    var category: String
    var value: Double
}

struct DiagramView: View {
    
    let data: [ValuePerCategory] = [
        .init(category: "A", value: 5),
        .init(category: "B", value: 9),
        .init(category: "C", value: 7)
    ]
    var body: some View {
        Text("Diagrama")
        
    }
}




//
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiagramView()
//    }
//}
