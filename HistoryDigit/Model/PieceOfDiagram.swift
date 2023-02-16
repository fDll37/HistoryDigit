//
//  PieceOfDiagram.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import Foundation
import SwiftUI

struct PieceOfDiagram: Identifiable {
    let id = UUID()
    let color: Color
    var percent: CGFloat
    var value: CGFloat
    var type: String
}


