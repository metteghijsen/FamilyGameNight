//
//  ViewA.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI
import FortuneWheel

struct ViewA: View {
    
    @State var firstPlayer = "Select a player"
    @State var secondPlayer = ""
    @State var thirdPlayer = ""
    @State var fourthPlayer = ""
    
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
                NavigationLink("Play") {
                    WheelView(names: selectedNames)
                }
                    .disabled(secondPlayer == "Select a player" || secondPlayer == "" ? true : false)
                Button("Clear players") {
                    clearPlayers()
                }
                
                FortuneWheel(model: model)
                    .disabled(true)
                    .padding(50)
                
                //WheelPreview()
                
                Spacer()
                
                Group {
                    Menu(firstPlayer) {
                        ForEach(players, id: \.id) { player in
                            if(player.isSelected != true) {
                                //Don't ask me why swift expects parameters to be written like this within view elemements... Just don't.
                                //I also tried using in-out parameters (not considered as let) but everything under self is not mutating.. So now I use an ugly int parameter to determine which menu item needs to be adjusted
                                Button(player.name, action: {() in self.selectPlayer(number: 1, player: player)})
                            }
                        }
                    }
                    .disabled(firstPlayer != "Select a player" ? true : false)
                    
                    Menu(secondPlayer) {
                        ForEach(players, id: \.id) { player in
                            if(player.isSelected != true) {
                                Button(player.name, action: {() in self.selectPlayer(number: 2, player: player)})
                            }
                        }
                    }
                    .disabled(secondPlayer != "Select a player" ? true : false)
                    
                    Menu(thirdPlayer) {
                        ForEach(players, id: \.id) { player in
                            if(player.isSelected != true) {
                                Button(player.name, action: {() in self.selectPlayer(number: 3, player: player)})
                            }
                        }
                    }
                    .disabled(thirdPlayer != "Select a player" ? true : false)
                    
                    Menu(fourthPlayer) {
                        ForEach(players, id: \.id) { player in
                            if(player.isSelected != true) {
                                Button(player.name, action: {() in self.selectPlayer(number: 4, player: player)})
                            }
                        }
                    }
                    .disabled(fourthPlayer != "Select a player" ? true : false)
                }
                .padding(1)
                Spacer()
                
                
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
        //Couldn't get mutating parameters to work so I'll have to use an ugly switch statement here
        switch(number) {
        case 1:
            firstPlayer = player.name
            secondPlayer = "Select a player"
            break;
        case 2:
            secondPlayer = player.name
            thirdPlayer = "Select a player"
            break;
        case 3:
            thirdPlayer = player.name
            fourthPlayer = "Select a player"
            break;
        case 4:
            fourthPlayer = player.name
            break;
        default:
            break;
        }
        
        //Directly editing a player is not possible because it's a constant. Find the player in the array first
        players[player.id].isSelected = true
        //player.isSelected = true
        
        //Refresh the previesNames array
        //reloadWheel()
        reloadPreviewNames()
    }
                       
    private func clearPlayers() {
        firstPlayer = "Select a player"
        secondPlayer = ""
        thirdPlayer = ""
        fourthPlayer = ""
        clearPreviewNames()
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
