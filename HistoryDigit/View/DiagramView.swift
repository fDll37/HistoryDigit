//
//  DiagramView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 11.02.2023.
//
import Foundation
import SwiftUI


struct DiagramView: View {
    
    @ObservedObject var charDataObj = DiagramContainer()
    @State private var indexOfTappedSlice = -1
    
    @FetchRequest(sortDescriptors: [])
    var numbers: FetchedResults<Number>
    
    var body: some View {
        VStack {
            Text("Circle diagram")
                .font(.system(size: 28))
                .fontWeight(.medium)
            HStack {
                charCircleView
                .frame(width: 150, height: 200, alignment: .trailing)
                    .onAppear() {
                        self.charDataObj.calcOfPathDiagram(numbers: numbers)
                    }
                VStack {
                    charListView
                        .padding(8)
                        .frame(width: 100, height: 20, alignment: .trailing)
                }
                .frame(width: 200, alignment: .trailing)
            }
        }
    }
}

extension DiagramView {
    
    private var charCircleView: some View {
        ZStack {
            ForEach(0..<charDataObj.charData.count) { index in
                Circle()
                    .trim(from: index == 0 ? 0.0 : charDataObj.charData[index - 1].value / 100,
                          to: charDataObj.charData[index].value / 100)
                    .stroke(charDataObj.charData[index].color, lineWidth: 25)
                    .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                    .animation(.spring())
            }
        }
    }
    
    private var charListView: some View {
        ForEach(0..<charDataObj.charData.count) { index in
            HStack {
                Text(charDataObj.charData[index].type + " " + String(format: "%.2f", Double(charDataObj.charData[index].percent)) + "%")
                    .onTapGesture {
                        indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                    }
                    .font(indexOfTappedSlice == index ? .headline : .subheadline)
                    .frame(width: indexOfTappedSlice == index ? 100 : 120)
                RoundedRectangle(cornerRadius: 3)
                    .fill(charDataObj.charData[index].color)
                    .frame(width: 20, height: 20)
            }
        }
    }
}

struct DiagramView_Previews: PreviewProvider {
    static var previews: some View {
        DiagramView()
    }
}
