//
//  LibraryItem.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 18/11/2022.
//

import Foundation
import SwiftUI

struct LibraryItem: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
   
    var price: String
    var yearPublished: String
    var requiredItems: String
    var minPlayers: Int
    var maxPlayers: Int
    var minPlayTime: String
    var maxPlayTime: String
    var minAge: String
      
    var description: String
    var category: String
    
    private var imageName: String
    var thumbnailImage: Image {
         Image(imageName)
    }
    
    private var bannerName: String
    var bannerImage: Image {
         Image(bannerName)
    }
}

