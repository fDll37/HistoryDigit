//
//  ListView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 13.02.2023.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var listNumbers = NumberList()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listNumbers.listNumber) { index in
                    ElementListView(element: $listNumbers.listNumber[index])
                }
                .onMove(perform: listNumbers.moveListItem)
                .onDelete(perform: listNumbers.deleteListItem)
                .onAppear() {
                    listNumbers.saveListItems()
                    listNumbers.printChecklistContents()
                }
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
