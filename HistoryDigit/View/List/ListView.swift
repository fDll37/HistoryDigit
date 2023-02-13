//
//  ListView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 13.02.2023.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext)
    var moc
    
    @FetchRequest(sortDescriptors: [])
    var numbers: FetchedResults<Number>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(numbers) { number in
                    ElementListView(element: number)
                }
                .onDelete(perform: { indexSet in
                    let number = self.numbers[indexSet.first!]
                    self.moc.delete(number)
                    try! self.moc.save()
                })
            }
            
            .navigationBarItems(trailing: EditButton())
            .navigationTitle("Список элементов")
            
            
            
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
