//
//  SearchView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 08.02.2023.
//

import SwiftUI

struct SearchView: View {
    
//    @Environment(\.presentationMode) var presentationMode
    var listNumber: NumberList
    
    var body: some View {
        
        Button(action: {
            let newNumber = SaveNumber(number: 6, text: "This is SIX", type: TypeNumber.math.value)
            self.listNumber.listNumber.append(newNumber)
            self.listNumber.saveListItems()
//            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                Text("добавить новое число")
            }
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(listNumber: NumberList())
    }
}
