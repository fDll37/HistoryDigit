//
//  FilterView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import SwiftUI

struct FilterView: View {
    
    @State private var sendToSearchResult = FilterSearch.shared
    @State private var typeArray: [TypeNumber] = [.math, .trivia, .date, .year, .random]
    @State private var selectIndex = 0
    @State private var showPopUp: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Выберите тип числа")
                .font(.title)
            
            Picker(selection: $selectIndex, label: Text("")) {
                ForEach(0..<typeArray.count) {
                    Text(String(self.typeArray[$0].value))
                }
            }
            .padding()
            .frame(width: 200, height: 150, alignment: .center)
            .onChange(of: selectIndex) { newValue in
                showPopUp = false
            }
            
            Text("Вы выбрали: \(typeArray[selectIndex].value)")
                .padding()
                .foregroundColor(.black)
                .font(.headline)
                .padding(.top, 10)
            
            Spacer()
            
            if showPopUp && typeArray[selectIndex] == sendToSearchResult.result {
                Text("Сохранено ✅")
                    .font(.system(size: 20))
                    .foregroundColor(.green)
                    .frame(alignment: .center)
                
            }
            Spacer()
            
            Button{
                sendToSearchResult.setResult(type: typeArray[selectIndex])
                self.showPopUp = true
            } label: {
                Text("Сохранить")
            }
            .background(.blue)
            .foregroundColor(.white)
            .buttonStyle(.borderedProminent)
            .cornerRadius(5)
            .frame(width: 130, alignment: .center)
            
            Spacer()
        }
    }
    
    
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
