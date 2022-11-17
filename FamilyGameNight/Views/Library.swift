//
//  ViewC.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI

struct ViewC: View {
    var body: some View {
        ZStack {
            Color.green
            
            Image(systemName: "books.vertical.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        }
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}
