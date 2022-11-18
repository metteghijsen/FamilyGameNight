//
//  LibraryItem.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 18/11/2022.
//

import Foundation

struct LibraryItem: Hashable, Codable {
    var id: Int
    var name: String
   
    var price: Double
    var yearPublished: Int
    var minPlayers: Int
    var maxPlayers: Int
    var minPlaytime: Int
    var maxPlaytime: Int
    var minAge: Int
    
    var description: String
}
