//
//  ModelData.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 18/11/2022.
//

import Foundation
import Combine

var players: [Player] = load("Profiles.json")
var previewNames: [String] = ["", "", "", "", "", "", "", "", ""]
var selectedNames: [String] = []
var familyMembers: [String] = reloadFamilyMembers()

final class ModelData: ObservableObject {
    @Published var libraryItemArray: [LibraryItem] = load("boardgameData.json")
}

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

func reloadFamilyMembers() -> [String] {
    var names : [String] = []
    for player in players {
        names.append(player.name)
    }
    return names
}

/*
func addFamilyMember(name: String)  {
    var id = 0;
    for player in players {
        if(player.id > id) {
            id = player.id
        }
    }
    let member : Player = Player(id: id, name: name)
    players.append(member)
}
 */

func clearWheelNames() {
    //Set all objects to not selected
    for player in players {
        players[player.id].isSelected = false
        players[player.id].bonus = false
    }
    
    //Clear the arrays
    let max = previewNames.count
    selectedNames = []
    previewNames = []
    while(previewNames.count < max) {
        previewNames.append("")
    }
}

func reloadWheelNames() {
    //Reload the preview names and the selected names
    let max = previewNames.count
    selectedNames = []
    previewNames = []
    for player in players {
        if(player.isSelected) {
            previewNames.append(player.name)
            selectedNames.append(player.name)
            if(player.bonus) {
                previewNames.append(player.name)
                selectedNames.append(player.name)
            }
        }
    }
    while(previewNames.count < max) {
        previewNames.append("")
    }
}


