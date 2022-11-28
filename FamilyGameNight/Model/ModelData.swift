//
//  ModelData.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 18/11/2022.
//

import Foundation

var libraryItemArray: [LibraryItem] = load("boardgameData.json")
var players: [Player] = load("Profiles.json")
var previewNames: [String] = ["", "", "", ""]

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func getNames() -> [String] {
    //Create new array with strings MAKE SURE TO STATE THE VARIABLE TYPE AND INITIALISE IT AS WELL
    //let names : [String] = ["", "", "", ""]
    
    //Fill array before returning it
    /*
    for player in players {
        names.append(player.name)
    }
     */
    //Rewrite the array of names on the wheel

    var names : [String] = []
    for player in players {
        if(player.isSelected) {
            names.append(player.name)
        }
    }
    while(names.count < 4) {
        names.append("")
    }
    
    return names
}

func clearPreviewNames() {
    let max = previewNames.count
    previewNames = []
    while(previewNames.count < max) {
        previewNames.append("")
    }
}

func reloadPreviewNames() {
    let max = previewNames.count
    //Rewrite the array of names on the wheel
    previewNames = []
    for player in players {
        if(player.isSelected) {
            previewNames.append(player.name)
        }
    }
    while(previewNames.count < max) {
        previewNames.append("")
    }
}


