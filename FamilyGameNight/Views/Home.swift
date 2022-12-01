//
//  ViewA.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI
import FortuneWheel

struct ViewA: View {
    
    @State var playerMenus = ["Select player one", "", "", "", "", "", ""]
    @State var bonus = [false, false, false, false, false, false, false]
    
    var body: some View {
        NavigationView{
            let model = FortuneWheelModel(
                titles: previewNames, size: 320,
                onSpinEnd: onSpinEnd,
                getWheelItemIndex: getWheelItemIndex
            )
            VStack {
                Text("Wheel settings")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                
                FortuneWheel(model: model)
                    .disabled(true)
                    .padding(20)
                
                Group {
                    HStack {
                        VStack {
                            Menu(playerMenus[0]) {
                                ForEach(players, id: \.id) { player in
                                    if(player.isSelected != true) {
                                        Button(player.name, action: {() in self.selectPlayer(number: 0, player: player)})
                                    }
                                }
                            }
                            .frame(height: 17.0)
                            .disabled(playerMenus[0] != "Select player one" ? true : false)
                            
                            Menu(playerMenus[1]) {
                                ForEach(players, id: \.id) { player in
                                    if(player.isSelected != true) {
                                        Button(player.name, action: {() in self.selectPlayer(number: 1, player: player)})
                                    }
                                }
                            }
                            .frame(height: 17.0)
                            .disabled(playerMenus[1] != "Select player two" ? true : false)
                            
                            Menu(playerMenus[2]) {
                                ForEach(players, id: \.id) { player in
                                    if(player.isSelected != true) {
                                        Button(player.name, action: {() in self.selectPlayer(number: 2, player: player)})
                                    }
                                }
                            }
                            .frame(height: 17.0)
                            .disabled(playerMenus[2] != "Select player three" ? true : false)
                            
                            Menu(playerMenus[3]) {
                                ForEach(players, id: \.id) { player in
                                    if(player.isSelected != true) {
                                        Button(player.name, action: {() in self.selectPlayer(number: 3, player: player)})
                                    }
                                }
                            }
                            .frame(height: 17.0)
                            .disabled(playerMenus[3] != "Select player four" ? true : false)
                            
                            Menu(playerMenus[4]) {
                                ForEach(players, id: \.id) { player in
                                    if(player.isSelected != true) {
                                        Button(player.name, action: {() in self.selectPlayer(number: 4, player: player)})
                                    }
                                }
                            }
                            .frame(height: 17.0)
                            .disabled(playerMenus[4] != "Select player five" ? true : false)
                            
                            Menu(playerMenus[5]) {
                                ForEach(players, id: \.id) { player in
                                    if(player.isSelected != true) {
                                        Button(player.name, action: {() in self.selectPlayer(number: 5, player: player)})
                                    }
                                }
                            }
                            .frame(height: 17.0)
                            .disabled(playerMenus[5] != "Select player six" ? true : false)
                        }
                        VStack {
                            Button(action: {toggleBonus(id: 0)}) {
                                Image(systemName: bonus[0] ? "minus.square.fill" : "plus.app.fill")
                                    .foregroundColor(Color.accentColor)
                            }
                            .frame(height: 17.0)
                            .frame(height: 20.0)
                            .offset(x: 0, y: playerMenus[0] == "Select player one" || playerMenus[0] == "" ? -5000 : 0)
                            
                            Button(action: {toggleBonus(id: 1)}) {
                                Image(systemName: bonus[1] ? "minus.square.fill" : "plus.app.fill")
                                    .foregroundColor(Color.accentColor)
                            }
                            .frame(height: 17.0)
                            .offset(x: 0, y: playerMenus[1] == "Select player two" || playerMenus[1] == "" ? -5000 : 0)
                            
                            Button(action: {toggleBonus(id: 2)}) {
                                Image(systemName: bonus[2] ? "minus.square.fill" : "plus.app.fill")
                                    .foregroundColor(Color.accentColor)
                            }
                            .frame(height: 17.0)
                            .offset(x: 0, y: playerMenus[2] == "Select player three" || playerMenus[2] == "" ? -5000 : 0)
                            
                            Button(action: {toggleBonus(id: 3)}) {
                                Image(systemName: bonus[3] ? "minus.square.fill" : "plus.app.fill")
                                    .foregroundColor(Color.accentColor)
                            }
                            .frame(height: 17.0)
                            .offset(x: 0, y: playerMenus[3] == "Select player four" || playerMenus[3] == "" ? -5000 : 0)
                            
                            Button(action: {toggleBonus(id: 4)}) {
                                Image(systemName: bonus[4] ? "minus.square.fill" : "plus.app.fill")
                                    .foregroundColor(Color.accentColor)
                            }
                            .frame(height: 17.0)
                            .offset(x: 0, y: playerMenus[4] == "Select player five" || playerMenus[4] == "" ? -5000 : 0)
                            
                            Button(action: {toggleBonus(id: 5)}) {
                                Image(systemName: bonus[5] ? "minus.square.fill" : "plus.app.fill")
                                    .foregroundColor(Color.accentColor)
                            }
                            .frame(height: 17.0)
                            .offset(x: 0, y: playerMenus[5] == "Select player six" || playerMenus[5] == "" ? -5000 : 0)
                        }
                    }
                    .padding(.trailing, -25.0)
                }
                .padding(10)
                
                Group {
                    NavigationLink("Play") {
                        WheelView(names: selectedNames)
                    }
                    .disabled(playerMenus[1] == "Select a player" || playerMenus[1] == "" ? true : false)
                    .foregroundColor(playerMenus[1] == "Select a player" || playerMenus[1] == "" ? .gray : .white)
                    Button("Clear players") {
                        clearPlayers()
                    }
                }
                .frame(width: 200.0, height: 30.0)
                .background(Color.accentColor)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    private func onSpinEnd(index: Int) {
    }

    private func getWheelItemIndex() -> Int {
        //The ultimate winner is determined by the id given heres
        //returns a random number between 0 and the length of the array -1
        return Int(arc4random_uniform(UInt32(previewNames.count)))
    }
    
    private func selectPlayer(number : Int, player : Player) {
        var newString : String = ""
        switch(number) {
        case 0:
            newString = "Select player two"
            break;
        case 1:
            newString = "Select player three"
            break;
        case 2:
            newString = "Select player four"
            break;
        case 3:
            newString = "Select player five"
            break;
        case 4:
            newString = "Select player six"
            break;
        default:
            break;
        }
        
        playerMenus[number] = player.name
        if (newString != "") {
            playerMenus[number + 1] = newString
        }
        players[player.id].isSelected = true
        reloadWheelNames()
    }
                       
    private func clearPlayers() {
        bonus = [false, false, false, false, false, false, false]
        playerMenus = ["Select player one", "", "", "", "", ""]
        clearWheelNames()
    }
    
    private func toggleBonus(id : Int)  {
        for player in players {
            if (player.name == playerMenus[id]) {
                players[player.id].bonus = !players[player.id].bonus
                bonus[id] = !bonus[id]
            }
        }
        reloadWheelNames()
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
