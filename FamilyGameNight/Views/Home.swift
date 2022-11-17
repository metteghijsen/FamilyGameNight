//
//  ViewA.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI

struct ViewA: View {
    var body: some View {
        ZStack {
            Color.blue
            
            Image(systemName: "house.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
