//
//  ResultSearch.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import SwiftUI

struct ResultSearch: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Text("Result Search")
        VStack {
            Button("Add favorite") {
                let number = Number(context: moc)
                number.id = UUID()
                number.text = "Test text"
                number.number = "6"
                number.type = TypeNumber.math.value
                
                try? moc.save()
            }
        }
    }
}

struct ResultSearch_Previews: PreviewProvider {
    static var previews: some View {
        ResultSearch()
    }
}
