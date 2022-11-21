//
//  LibraryItemRow.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 18/11/2022.
//

import SwiftUI

struct LibraryItemRow: View {
    var libraryItem: LibraryItem
    
    var body: some View {
        HStack {
                   libraryItem.image
                       .resizable()
                       .frame(width: 50, height: 50)
                   Text(libraryItem.name)

                   Spacer()
               }
    }
}

struct LibraryItemRow_Previews: PreviewProvider {
    static var previews: some View {
        LibraryItemRow(libraryItem: libraryItemArray[0])
    }
}
