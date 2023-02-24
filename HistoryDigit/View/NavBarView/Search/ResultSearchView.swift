//
//  ResultSearch.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import SwiftUI

struct ResultSearchView: View {
    @Environment(\.managedObjectContext)
    var moc
    
    @Binding
    var text : String
    
    @Binding
    var filter: FilterSearch
    
    @State
    private var number: NumberFromAPI?
    
    @State
    private var color: Color?
    
    @State
    private var showPopUp: Bool = false
    
    var body: some View {
        VStack {
            Text("Результат поиска:")
                .font(.system(size: 35))
                .font(.headline)

            Spacer()
            Text(String(number?.number ?? 0))
                .font(.system(size: number?.number ?? 0 < 1000 ? 130 : 80))
                .font(.headline)
                .foregroundColor(self.color)
                .fontWeight(.heavy)
                .frame(width: 400, height: 150, alignment: .bottom)
            
            Text(number?.type ?? "Non type")
                .fontWeight(.heavy)
                .foregroundColor(self.color)

            
            Spacer()
            Text(number?.text ?? "Non text")
                .font(.system(size: number?.text.count ?? 0 > 30 ? 18 : 30))
                .multilineTextAlignment(.leading)
                .frame(width: 300)
                .lineLimit(nil)
                .background(self.color)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            
            Spacer()
            
            if showPopUp && self.number != nil {
                Text("Сохранено ✅")
                    .font(.system(size: 20))
                    .foregroundColor(.green)
                    .frame(alignment: .center)
                
            }
            
            Spacer()
            Button("Add to ⭐️") {
                if self.number != nil {
                    showPopUp = true
                    let numberMoc = Number(context: moc)
                    numberMoc.id = UUID()
                    numberMoc.text = self.number!.text
                    numberMoc.number = String(self.number!.number!)
                    numberMoc.type = self.number!.type!
                    try? moc.save()
                }

            }
            .background(.blue)
            .foregroundColor(.yellow)
//            .fontWeight(.heavy)
            .cornerRadius(5)
            .frame(width: 130, alignment: .center)
            .padding()
            .buttonStyle(.borderedProminent)
        }
        .onAppear() {
            switch filter.result {
            case .math:
                NumberAPI.shared.getMath(query: text) { insideNumber in
                    self.number = insideNumber
                }
                self.color = .blue
                
            case .year:
                NumberAPI.shared.getYear(query: text) { insideNumber in
                    self.number = insideNumber
                }
                self.color = .green
                
                
            case .date:
                NumberAPI.shared.getDate(query: text) { insideNumber in
                    self.number = insideNumber
                }
                self.color = .red
                
            case .trivia:
                NumberAPI.shared.getTrivia(query: text) { insideNumber in
                    self.number = insideNumber
                }
                self.color = .orange
            
            case .random:
                NumberAPI.shared.getRandom { insideNumber in
                    self.number = insideNumber
                }
                
            }
        }
    }
}

struct ResultSearch_Previews: PreviewProvider {
    static var previews: some View {
        ResultSearchView(text: .constant("5"), filter: .constant(FilterSearch.shared))
    }
}
