//
//  Plate.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 5/1/2023.
//

import SwiftUI

struct Plate: View {
    
    var number: String
    var description: String
    
    let font = "DINAlternate-Condensed"
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.linearGradient(
                    Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: UnitPoint(x: 0.1, y: 0),
                    endPoint: UnitPoint(x: 0.8, y: 0.4)
                ))
                .frame(height: 150)
                .padding()
            RoundedRectangle(cornerRadius: 30)
                .stroke(.white, lineWidth: 10)
                .shadow(radius: 2, x:0, y:1)
                .frame(height: 145)
                .padding()
            VStack {
                Text(number)
                    .font(.custom(font, size: 60))
                    .font(.title)
                Text(description)
                    .font(.custom(font, size: 25))
                    .font(.title3)
            }
            .foregroundColor(.white)
            .shadow(radius: 2, x:0, y: 1)
        }
    }
    
    static let gradientStart = Color("ShadedPlateColor")
    static let gradientEnd = Color("PlateColor")
}


struct Plate_Previews: PreviewProvider {
    
    static var cars = Garage().cars
    static var previews: some View {
        Plate(number: cars[0].licensePlate, description: cars[0].model)
    }
}
