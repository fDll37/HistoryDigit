//
//  NumberView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 07.02.2023.
//

import SwiftUI

struct NumberView: View {
    
    @State var numberMath: Number?
    @State var numberTrivia: Number?
    @State var numberRandom: Number?
    
    
    var body: some View {
        Group{
            VStack {
                Group{
                    Text("\(numberMath?.number ?? 0)")
                    Text(numberMath?.text ?? "Non text")
                    Text(numberMath?.type ?? "Non type")
//                        .padding()
                }
//                Spacer()
                Text("\(numberTrivia?.number ?? 0)")
                Text(numberTrivia?.text ?? "Non text")
                Text(numberTrivia?.type ?? "Non type")
//                    .padding()
//                Spacer()
                Text("\(numberRandom?.number ?? 0)")
                Text(numberRandom?.text ?? "Non text")
                Text(numberRandom?.type ?? "Non type")
//                    .padding()

            }.onAppear() {
                NumberAPI.shared.getMath(query: "43") { insideNumber in
                    self.numberMath = insideNumber
                }
                NumberAPI.shared.getTrivia(query: "43") { insideNumber in
                    self.numberTrivia = insideNumber
                }
                NumberAPI.shared.getRandom(){ insideNumber in
                    self.numberRandom = insideNumber
                }
            }
        }
        
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView()
    }
}
