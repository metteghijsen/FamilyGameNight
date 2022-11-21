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
   
    var price: Double
    var yearPublished: Int
    var requiredItems: String
    var minPlayers: Int
    var maxPlayers: Int
    var minPlayTime: String
    var maxPlayTime: String
    var minAge: String
      
    var description: String
    
    private var imageName: String
    var image: Image {
         Image(imageName)
    }
}

