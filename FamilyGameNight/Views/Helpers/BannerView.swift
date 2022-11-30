//
//  BannerView.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 21/11/2022.
//

import SwiftUI

struct BannerView: View {
    var image: Image

    var body: some View {
        image
            .resizable()
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(image: Image("monopolybanner"))
    }
}
