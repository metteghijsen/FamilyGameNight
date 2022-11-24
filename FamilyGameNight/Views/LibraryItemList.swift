//
//  LibraryItemList.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 21/11/2022.
//

import SwiftUI

struct LibraryItemList: View {
    var body: some View {
        let boardgameArray = libraryItemArray.filter {
            LibraryItem in return LibraryItem.category == "boardgame"
        }
        
        let switchgameArray = libraryItemArray.filter {
            LibraryItem in return LibraryItem.category == "switchgame"
        }

        List(boardgameArray) { libraryItem in
            NavigationLink {
                LibraryItemDetails(libraryItem: libraryItem)
            } label: {
                LibraryItemRow(libraryItem: libraryItem)
            }
        }
        
        List(switchgameArray) { libraryItem in
            NavigationLink {
                LibraryItemDetails(libraryItem: libraryItem)
            } label: {
                LibraryItemRow(libraryItem: libraryItem)
            }
        }
        
//        List {
//            Section(header: Text("Board games"))
//            {
//
//            }
//
//            Section(header: Text("Card games"))
//            {
//
//            }
//
//            Section(header: Text("Nintendo Switch games"))
//            {
//
//            }
//        }
    }
}

struct LibraryItemList_Previews: PreviewProvider {
    static var previews: some View {
        LibraryItemList()
    }
}
