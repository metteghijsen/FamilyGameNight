//
//  LibraryItemList.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 21/11/2022.
//

import SwiftUI

struct LibraryItemList: View {
    var body: some View {
        List(libraryItemArray) { libraryItem in
            NavigationLink {
                LibraryItemDetails(libraryItem: libraryItem)
            } label: {
                LibraryItemRow(libraryItem: libraryItem)
            }
        }
    }
}

struct LibraryItemList_Previews: PreviewProvider {
    static var previews: some View {
        LibraryItemList()
    }
}
