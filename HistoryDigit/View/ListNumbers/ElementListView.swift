//
//  ElementListView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 13.02.2023.
//

import SwiftUI
import CoreData

struct ElementListView: View {
    
    @ObservedObject var element: Number
    
    
    var body: some View {
        VStack {
            Text(String(element.number ?? ""))
                .bold()
                .font(.system(size: 40))
                .padding(.bottom)
                .padding(.top)
            Text(String(element.text ?? ""))
                .frame(maxWidth: .infinity)
                .font(.system(size: 20))
            Text(String(element.type ?? ""))
                .bold()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top)
                .font(.system(size: 20))
                .foregroundColor(setColor())
        }
    }
    
    func setColor() -> Color {
        switch element.type ?? "" {
        case "math":
            return .blue
        case "trivia":
            return .orange
        case "date":
            return .red
        case "year":
            return .green
        default:
            return .black
        }
    }
}

struct ElementListView_Previews: PreviewProvider {
    static var previews: some View {
        ElementListView(element: Number())
    }
}
