//
//  FilterView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import SwiftUI

struct FilterView: View {
    
    private var typeArray = ["math", "trivia", "date", "year"]
    @State private var selectIndex = 0
    
    var body: some View {
        VStack {
            Text("Выберите тип числа")
                .font(.title)
            
            Picker(selection: $selectIndex, label: Text("")) {
                ForEach(0..<typeArray.count) {
                    Text(self.typeArray[$0])
                }
            }
            .padding()
            .frame(width: 200, height: 150, alignment: .center)
            
            Text("вы выбрали: \(typeArray[selectIndex])")
                .padding()
                .foregroundColor(.black)
                .font(.headline)
                .padding(.top, 10)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}


class Filter: ObservableObject {
    
}
