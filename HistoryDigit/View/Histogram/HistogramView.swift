//
//  HistogramView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 13.02.2023.
//

import SwiftUI

struct HistogramView: View {
    
    @ObservedObject
    var charDataObj = DiagramContainer()
    @FetchRequest(sortDescriptors: [])
    var numbers: FetchedResults<Number>
    
    var body: some View {
        
        VStack {
            Text("Histogram")
                .font(.system(size: 28))
                .fontWeight(.medium)
            HStack(spacing: 8) {
                ForEach(charDataObj.charData) { data in
                    BarView(value: data.percent, week: data.type, color: data.color)
                }
            }
            .padding(.bottom)
            .animation(.default)
        }
        .onAppear() {
            charDataObj.calcOfPathDiagram(numbers: numbers)
        }
        
    }
}

struct HistogramView_Previews: PreviewProvider {
    static var previews: some View {
        HistogramView()
    }
}
