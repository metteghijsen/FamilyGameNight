//
//  CircleImage.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 21/11/2022.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

      var body: some View {
          image
              .resizable()
              .frame(width: 250, height: 250)
              .clipShape(Circle())
              .overlay {
                  Circle().stroke(.white, lineWidth: 4)
              }
              .shadow(radius: 7)
      }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("monopoly"))
    }
}
