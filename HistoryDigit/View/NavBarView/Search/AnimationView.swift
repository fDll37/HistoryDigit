//
//  AnimationView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import SwiftUI

struct AnimationView: View {
    
    let arrayColor: [Color] = [.white, .blue, .white, .blue, .white]
    
    @State private var angle: Double = 0
    @State private var angleTwo: Double = 45
    @State private var angleThree: Double = 90
    @State private var angleFour: Double = 135
    @State private var angleFive: Double = 180
    @State private var angleSix: Double = 270
    
    var body: some View {
        ZStack {
            Ellipse()
                .stroke(AngularGradient(colors: arrayColor, center: .center, startAngle: .zero, endAngle: Angle(degrees: 360)), lineWidth: 2)
                .frame(width: 300, height: 250)
                .rotationEffect(Angle(degrees: angle))
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                            self.angle = 0
                            self.angle += 180
                        }
                        
                    }

                }
            Ellipse()
                .stroke(AngularGradient(colors: arrayColor, center: .center, startAngle: .zero, endAngle: Angle(degrees: 360)), lineWidth: 2)
                .frame(width: 300, height: 250)
                .rotationEffect(Angle(degrees: angleTwo))
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                            self.angleTwo = 0
                            self.angleTwo += 360
                        }
                    }
                }
            Ellipse()
                .stroke(AngularGradient(colors: arrayColor, center: .center, startAngle: .zero, endAngle: Angle(degrees: 360)), lineWidth: 2)
                .frame(width: 300, height: 250)
                .rotationEffect(Angle(degrees: angleThree))
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                            self.angleThree = 0
                            self.angleThree += 180
                        }
                    }
                }
            Ellipse()
                .stroke(AngularGradient(colors: arrayColor, center: .center, startAngle: .zero, endAngle: Angle(degrees: 360)), lineWidth: 2)
                .frame(width: 300, height: 250)
                .rotationEffect(Angle(degrees: angleFour))
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: false)) {
                            self.angleFour = 0
                            self.angleFour += 360
                        }
                    }
                }
            Ellipse()
                .stroke(AngularGradient(colors: arrayColor, center: .center, startAngle: .zero, endAngle: Angle(degrees: 360)), lineWidth: 2)
                .frame(width: 300, height: 250)
                .rotationEffect(Angle(degrees: angleFive))
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                            self.angleFive = 0
                            self.angleFive += 180
                        }
                    }
                }
            Ellipse()
                .stroke(AngularGradient(colors: arrayColor, center: .center, startAngle: .zero, endAngle: Angle(degrees: 360)), lineWidth: 2)
                .frame(width: 300, height: 250)
                .rotationEffect(Angle(degrees: angleSix))
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                            self.angleSix = 0
                            self.angleSix += 360
                        }
                    }
                    
                }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
