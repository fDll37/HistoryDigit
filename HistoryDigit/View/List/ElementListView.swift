//
//  ElementListView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 13.02.2023.
//

import SwiftUI

struct ElementListView: View {
    
    @Binding var element: SaveNumber
    
    var body: some View {
        VStack {
            Text("Число - \(element.number).")
            Text("Значение - \(element.text).")
            Text("Тип данных - \(element.type)")
        }
    }
}

struct ElementListView_Previews: PreviewProvider {
    static var previews: some View {
        ElementListView(element: .constant(SaveNumber(number: 4, text: "This is FOUR", type: TypeNumber.math.value)) )
    }
}
