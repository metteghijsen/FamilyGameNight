//
//  LibraryItemDetails.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 21/11/2022.
//

import SwiftUI

struct LibraryItemDetails: View {
    var libraryItem: LibraryItem
    
    var body: some View {
            ScrollView {
                ZStack {
                    BannerView(image: libraryItem.bannerImage)
                        .scaledToFit()
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 300)
                    .shadow(radius: 7)
                    
                    CircleImage(image: libraryItem.thumbnailImage)
                        .shadow(radius: 7)
                }
               
                VStack(alignment: .leading) {
                    HStack {
                        Text(libraryItem.name)
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Text(libraryItem.price)
                            .font(.title)
                            .bold()
                            .foregroundColor(.secondary)
                    }
                    
                    Text("Published in \(libraryItem.yearPublished)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    
                    Divider()
                    
                    Text("Game description")
                        .font(.title2)
                        .bold()
                    
                    Text(libraryItem.description)
                    
                    Divider()
                    Spacer()
                    
                    HStack{
                        Image(systemName: "clock.fill")
                        Text("\(libraryItem.minPlayTime) - \(libraryItem.maxPlayTime)")
                    }
                    HStack{
                        Image(systemName: "person.2.fill")
                        Text("\(libraryItem.minPlayers) - \(libraryItem.maxPlayers) players")
                    }
                    
                    HStack{
                        Image(systemName: "figure.and.child.holdinghands")
                        Text("\(libraryItem.minAge)")
                    }
                    
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle(libraryItem.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct LibraryItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        LibraryItemDetails(libraryItem: libraryItemArray[0])
    }
}
