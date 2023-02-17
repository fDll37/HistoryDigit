//
//  ResultSearch.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import SwiftUI

struct ResultSearchView: View {
    @Environment(\.managedObjectContext) var moc
    @Binding var number : NumberFromAPI?
    
    var body: some View {
        VStack {
            Text("Результат поиска:")
                .font(.system(size: 35))
                .font(.headline)

            Spacer()
            Text(String(number!.number!))
                .font(.system(size: number!.number! < 1000 ? 130 : 80))
                .font(.headline)
                .foregroundColor(.blue)
                .fontWeight(.heavy)
                .frame(width: 400, height: 150, alignment: .bottom)
            
            Text(number!.type!)
                .fontWeight(.heavy)
                .foregroundColor(.blue)

            
            Spacer()
            Text(number!.text)
                .font(.system(size: number!.text.count > 30 ? 18 : 30))
                .multilineTextAlignment(.leading)
                .frame(width: 300)
                .lineLimit(nil)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
                     
            Spacer()
            Button("Add to ⭐️") {
                let number = Number(context: moc)
                number.id = UUID()
                number.text = self.number!.text
                number.number = String(self.number!.number!)
                number.type = self.number!.type!
                
                try? moc.save()
            }
            .background(.blue)
            .foregroundColor(.yellow)
            .fontWeight(.heavy)
            .cornerRadius(5)
            .frame(width: 130, alignment: .center)
            .padding()
        }
    }
}

struct ResultSearch_Previews: PreviewProvider {
    static var previews: some View {
        ResultSearchView(number: .constant(
            NumberFromAPI(text: "Text for this number Text for this numberText for this numberText for this numberText for this numberText for this numberText for this numberText for this numberText for this numberText for this numberText for this number",
                          found: true,
                          number: 3000,
                          type: TypeNumber.math.value,
                          date: "121212",
                          year: "2019")))
    }
}
