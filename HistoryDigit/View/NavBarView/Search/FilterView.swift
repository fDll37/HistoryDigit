//
//  FilterView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import SwiftUI

struct FilterView: View {
    
    @State private var sendToSearchResult = FilterSearch.shared
    @State private var typeArray: [TypeNumber] = [.math, .trivia, .date, .year]
    @State private var selectIndex = 0
    
    var body: some View {
        VStack {
            Text("Выберите тип числа")
                .font(.title)
            
            Picker(selection: $selectIndex, label: Text("")) {
                ForEach(0..<typeArray.count) {
                    Text(String(self.typeArray[$0].value))
                }
            }
            .padding()
            .frame(width: 200, height: 150, alignment: .center)
            
            Text("вы выбрали: \(typeArray[selectIndex].value)")
                .padding()
                .foregroundColor(.black)
                .font(.headline)
                .padding(.top, 10)
            Button({
                "save filter"
            }(), action: {
                sendToSearchResult.setResult(type: typeArray[selectIndex])
                print("filter after save = \(sendToSearchResult.result.value)")
            })
            .background(.blue)
            .foregroundColor(.black)
//            .fontWeight(.heavy)
            .cornerRadius(5)
            .frame(width: 130, alignment: .center)
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
