//
//  ElementListView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 13.02.2023.
//

import SwiftUI
import CoreData

struct ElementListView: View {

    @ObservedObject var element: Number
    
    var body: some View {
        VStack {
            Text("Число - \(element.number ?? "").")
            Text("Значение - \(element.text ?? "").")
            Text("Тип данных - \(element.type ?? "")")
        }
    }
}

struct ElementListView_Previews: PreviewProvider {
    static var previews: some View {
        ElementListView(element: Number())
    }
}
