//
//  SearchView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 08.02.2023.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        
        Button("Add") {
            let number = Number(context: moc)
            number.id = UUID()
            number.text = "Test text"
            number.number = "6"
            number.type = TypeNumber.trivia.value
            
            try? moc.save()
        }

        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
