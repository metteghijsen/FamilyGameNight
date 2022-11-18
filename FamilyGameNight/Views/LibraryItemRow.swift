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
        Text(libraryItem.name)
    }
}

struct LibraryItemRow_Previews: PreviewProvider {
    static var previews: some View {
        LibraryItemRow(libraryItem: libraryItemArray[0])
    }
}
