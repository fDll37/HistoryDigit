//
//  ContentView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 07.02.2023.
//

import SwiftUI

struct ContentView: View {

    @State var number: Number? = NumberAPI.number

    var body: some View {

        var math = NumberAPI.shared.getMath(query: "4") {
            self.number = NumberAPI.number
        }
        Text("Hello, world!")
        Text(number?.text ?? "Not text")
            .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

