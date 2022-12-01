//
//  AddMemberWindow.swift
//  FamilyGameNight
//
//  Created by Sam Bos on 30/11/2022.
//

import SwiftUI

struct AddMemberWindow: View {
    
    @State var memberName : String = ""
    @State var showWindow : Bool = true
    
    var body: some View {
        
        VStack {
            TextField("Enter your name", text: $memberName)
                .onSubmit {
                    addFamilyMember(name: memberName)
            }
            Button("Add") {
                addFamilyMember(name: memberName)
                showWindow = false
                toggleWindow()
            }
            
            ForEach(players, id: \.id) { player in
                Text(player.name)
            }
        }
            //.offset(x: 0, y: showWindow ? 0 : -6000)
    }
    
    private func toggleWindow() {
        showWindow = !showWindow
    }
}

struct AddMemberWindow_Previews: PreviewProvider {
    static var previews: some View {
        AddMemberWindow()
    }
}
