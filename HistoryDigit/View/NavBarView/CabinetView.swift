//
//  Cabinet.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 07.02.2023.
//

import SwiftUI

struct CabinetView: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                DiagramView()
                    .padding(.leading, 25)
                Spacer()
                HistogramView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ListView()) {
                        HStack {
                            Image(systemName: "list.number")
                            Text("Мои числа")
                        }
                    }
                }
            }
        }
    }
    
}

struct Cabinet_Previews: PreviewProvider {
    static var previews: some View {
        CabinetView()
    }
}
