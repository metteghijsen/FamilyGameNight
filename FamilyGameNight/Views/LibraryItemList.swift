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
        
        let cardgameArray = libraryItemArray.filter {
            LibraryItem in return LibraryItem.category == "cardgame"
        }

//        List(boardgameArray) { libraryItem in
//            NavigationLink {
//                LibraryItemDetails(libraryItem: libraryItem)
//            } label: {
//                LibraryItemRow(libraryItem: libraryItem)
//            }
//        }
//
//        List(switchgameArray) { libraryItem in
//            NavigationLink {
//                LibraryItemDetails(libraryItem: libraryItem)
//            } label: {
//                LibraryItemRow(libraryItem: libraryItem)
//            }
//        }
        
        List {
            Section(header: Text("Board games"))
            {
                ForEach(boardgameArray, id: \.self){
                    game in
                    NavigationLink {
                        LibraryItemDetails(libraryItem: game)
                    } label: {
                        LibraryItemRow(libraryItem: game)
                    }
                }
            }

            Section(header: Text("Card games"))
            {
                ForEach(cardgameArray, id: \.self){
                    game in
                    NavigationLink {
                        LibraryItemDetails(libraryItem: game)
                    } label: {
                        LibraryItemRow(libraryItem: game)
                    }
                }
            }

            Section(header: Text("Nintendo Switch games"))
            {
                ForEach(switchgameArray, id: \.self){
                    game in
                    NavigationLink {
                        LibraryItemDetails(libraryItem: game)
                    } label: {
                        LibraryItemRow(libraryItem: game)
                    }
                }
            }
        }.listStyle(.grouped)
    }
}

struct LibraryItemList_Previews: PreviewProvider {
    static var previews: some View {
        LibraryItemList()
    }
}
