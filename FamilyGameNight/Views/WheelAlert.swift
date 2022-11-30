//
//  WheelAlert.swift
//  FamilyGameNight
//
//  Created by Sam Bos on 28/11/2022.
//

import SwiftUI

struct WheelAlert: View {
    let name: String
    var body: some View {
        Text(name + " won this round!")
            .font(.body)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .frame(width: 300.0, height: 50.0)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(100)
    }
}

struct WheelAlert_Previews: PreviewProvider {
    static var previews: some View {
        WheelAlert(name: "John Doe")
    }
}
