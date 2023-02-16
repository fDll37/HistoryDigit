//
//  HistogramBar.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//
import SwiftUI
import Foundation

struct BarView: View {
    
    let maxValue: CGFloat = 200
    var value: CGFloat = 0
    var week: String = ""
    var color: Color = .white
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 30, height: maxValue)
                    .foregroundColor(Color.gray)
                Capsule()
                    .frame(width: 30, height: value * 2)
                    .foregroundColor(color)
            }
            Text(week)
        }
        .frame(height: 250)
    }
}
