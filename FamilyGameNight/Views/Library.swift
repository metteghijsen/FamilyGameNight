//
//  ViewC.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI

struct ViewC: View {
    var body: some View {
        NavigationView{
            LibraryItemList()
            .navigationTitle("Family Library")
        }
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}
