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
        /*
        NavigationView{
            ScrollView{
                ZStack {
                    Color.blue
                
                    Image(systemName: "house.fill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 100))
                }
            }
            .navigationTitle("Home")
        }
         */
        
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
                
                FortuneWheel(model: model)
                    .disabled(true)
                    .padding(20)
                
                //Spacer()
                
                Group {
                    HStack {
                        Menu(playerMenus[0]) {
                            ForEach(players, id: \.id) { player in
                                if(player.isSelected != true) {
                                    Button(player.name, action: {() in self.selectPlayer(number: 0, player: player)})
                                }
                            }
                        }
                            .padding(.trailing, -30.0)
                            .disabled(playerMenus[0] != "Select player one" ? true : false)
                        
                        Button(action: {toggleBonus(id: 0)}) {
                            Image(systemName: "plus.app.fill")
                                .foregroundColor(bonus[0] ? Color.red : Color.blue)
                        }
                            .padding(.leading, 30.0)
                            .offset(x: 0, y: playerMenus[0] == "Select player one" || playerMenus[0] == "" ? -5000 : 0)
                    }
                    
                    HStack {
                        Menu(playerMenus[1]) {
                            ForEach(players, id: \.id) { player in
                                if(player.isSelected != true) {
                                    Button(player.name, action: {() in self.selectPlayer(number: 1, player: player)})
                                }
                            }
                        }
                        .padding(.trailing, -30.0)
                        .disabled(playerMenus[1] != "Select player two" ? true : false)
                        
                        Button(action: {toggleBonus(id: 1)}) {
                            Image(systemName: "plus.app.fill")
                                .foregroundColor(bonus[1] ? Color.red : Color.blue)
                        }
                        .padding(.leading, 30.0)
                            .offset(x: 0, y: playerMenus[1] == "Select player two" || playerMenus[1] == "" ? -5000 : 0)
                    }
                    
                    HStack {
                        Menu(playerMenus[2]) {
                            ForEach(players, id: \.id) { player in
                                if(player.isSelected != true) {
                                    Button(player.name, action: {() in self.selectPlayer(number: 2, player: player)})
                                }
                            }
                        }
                        .padding(.trailing, -30.0)
                        .disabled(playerMenus[2] != "Select player three" ? true : false)
                        
                        Button(action: {toggleBonus(id: 2)}) {
                            Image(systemName: "plus.app.fill")
                                .foregroundColor(bonus[2] ? Color.red : Color.blue)
                        }
                        .padding(.leading, 30.0)
                            .offset(x: 0, y: playerMenus[2] == "Select player three" || playerMenus[2] == "" ? -5000 : 0)
                    }
                    
                    HStack {
                        Menu(playerMenus[3]) {
                            ForEach(players, id: \.id) { player in
                                if(player.isSelected != true) {
                                    Button(player.name, action: {() in self.selectPlayer(number: 3, player: player)})
                                }
                            }
                        }
                        .padding(.trailing, -30.0)
                        .disabled(playerMenus[3] != "Select player four" ? true : false)
                        
                        Button(action: {toggleBonus(id: 3)}) {
                            Image(systemName: "plus.app.fill")
                                .foregroundColor(bonus[3] ? Color.red : Color.blue)
                        }
                        .padding(.leading, 30.0)
                            .offset(x: 0, y: playerMenus[3] == "Select player four" || playerMenus[3] == "" ? -5000 : 0)
                    }
                    
                    HStack {
                        Menu(playerMenus[4]) {
                            ForEach(players, id: \.id) { player in
                                if(player.isSelected != true) {
                                    Button(player.name, action: {() in self.selectPlayer(number: 4, player: player)})
                                }
                            }
                        }
                        .padding(.trailing, -30.0)
                        .disabled(playerMenus[4] != "Select player five" ? true : false)
                        
                        Button(action: {toggleBonus(id: 4)}) {
                            Image(systemName: "arrow.up.heart.fill")
                                .foregroundColor(bonus[4] ? Color.red : Color.blue)
                        }
                        .padding(.leading, 30.0)
                            .offset(x: 0, y: playerMenus[4] == "Select player five" || playerMenus[4] == "" ? -5000 : 0)
                    }
                    
                    HStack {
                        Menu(playerMenus[5]) {
                            ForEach(players, id: \.id) { player in
                                if(player.isSelected != true) {
                                    Button(player.name, action: {() in self.selectPlayer(number: 5, player: player)})
                                }
                            }
                        }
                        .padding(.trailing, -30.0)
                        .disabled(playerMenus[5] != "Select player six" ? true : false)
                        
                        Button(action: {toggleBonus(id: 6)}) {
                            Image(systemName: "plus.app.fill")
                                .foregroundColor(bonus[6] ? Color.red : Color.blue)
                        }
                        .padding(.leading, 30.0)
                            .offset(x: 0, y: playerMenus[5] == "Select player six" || playerMenus[5] == "" ? -5000 : 0)
                    }
                }
                .padding(1)
                //Spacer()
                
                Group {
                    /*
                    Button("Reload") {
                        reloadWheelNames()
                    }
                     */
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
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
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
        
        //Directly editing a player is not possible because it's a constant. Find the player in the array first
        players[player.id].isSelected = true
        //player.isSelected = true
        
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
