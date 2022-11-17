//
//  ViewB.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI

struct ViewB: View {
    var body: some View {
        ZStack {
            Color.red
            
            Image(systemName: "person.2.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        }
    }
}

struct ViewB_Previews: PreviewProvider {
    static var previews: some View {
        ViewB()
    }
}
