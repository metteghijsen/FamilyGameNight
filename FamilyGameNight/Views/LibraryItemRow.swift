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
                   libraryItem.thumbnailImage
                       .resizable()
                       .frame(width: 75, height: 75)
                       .cornerRadius(15)
            VStack {
                Text(libraryItem.name)
                .bold()
                .font(.title2)
            }

                Spacer()
            
                Text(libraryItem.price)
                .font(.subheadline)
                .bold()
                .foregroundColor(.secondary)
            
          
               }
    }
}

struct LibraryItemRow_Previews: PreviewProvider {
    static var previews: some View {
        LibraryItemRow(libraryItem: libraryItemArray[0])
    }
}
