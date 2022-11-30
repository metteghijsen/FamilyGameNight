//
//  LibraryItemList.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 21/11/2022.
//

import SwiftUI

struct LibraryItemList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLibraryItemArray: [LibraryItem] {
        modelData.libraryItemArray.filter { libraryItem in
            (!showFavoritesOnly || libraryItem.isFavorite)
        }
    }
    
    var body: some View {
        let boardgameArray = filteredLibraryItemArray.filter {
            LibraryItem in return LibraryItem.category == "boardgame"
        }
        
        let switchgameArray = filteredLibraryItemArray.filter {
            LibraryItem in return LibraryItem.category == "switchgame"
        }
        
        let cardgameArray = filteredLibraryItemArray.filter {
            LibraryItem in return LibraryItem.category == "cardgame"
        }
        
        List {
            Toggle(isOn: $showFavoritesOnly) {
                              Text("Show favorites only")
                          }
            
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
        }.listStyle(.sidebar)
    }
}

struct LibraryItemList_Previews: PreviewProvider {
    static var previews: some View {
        LibraryItemList()
            .environmentObject(ModelData())
    }
}
