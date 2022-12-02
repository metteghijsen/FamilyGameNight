//
//  ViewB.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI

struct ViewB: View {
    @State var showWindow = false
    @State private var memberName : String = ""
    
    /*
    static var wheelRed = Color("wheelRed")
    static var wheelYellow = Color("wheelYellow")
    static var wheelGreen = Color("wheelGreen")
    static var wheelBlue = Color("wheelBlue")
    static var wheelOrange = Color("wheelOrange")
    static var wheelPurple = Color("wheelPurple")
     */
    
    private var data: [Int] = Array(1...familyMembers.count)
    private let colors: [Color] = [Color("WheelRed"), Color("WheelGreen"), Color("WheelBlue"), Color("WheelYellow"), Color("wheelOrange"), Color("wheelPurple")]
    //private let colors: [Color] = [.red, .green, .blue, .yellow, ]
    
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack {
                    LazyVGrid(columns: adaptiveColumns, spacing: 20){
                        ForEach(players, id: \.id){ player in
                            ZStack{
                                Rectangle()
                                    .frame(width: 170, height: 170)
                                    .foregroundColor(colors[player.id%colors.count])
                                    .cornerRadius(30)
                                VStack{
                                    Image(systemName: "person.crop.circle.fill")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 80))
                                    Text(player.name)
                                    //Text("test")
                                        .foregroundColor(Color.white)
                                        .font(.system(size:20, weight: .bold, design:
                                                .rounded))
                                }
                            }
                        }
                        ZStack{
                            Capsule(style: .continuous)
                                            .stroke(Color.gray, style: StrokeStyle(lineWidth: 5, dash: [10]))
                                            .frame(width: 150, height: 150)

                            VStack{
                                Button(action: {toggleWindow()}) {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.gray)
                                        .font(.system(size: 100))
                                }
                            }
                        }
                    }
                    ZStack {
                        VStack {
                            TextField("Enter your name", text: $memberName)
                                .padding(.top, 20.0)
                                .onSubmit {
                                    addFamilyMember(name: memberName)
                                }
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            HStack {
                                Button("Cancel") {
                                    toggleWindow()
                                }
                                .padding(20)
                                Button("Add") {
                                    addFamilyMember(name: memberName)
                                    toggleWindow()
                                }
                                .padding(20)
                            }
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        }
                        .background(
                                Rectangle()
                                    .strokeBorder(Color.white,lineWidth: 3)
                                    .background(Color.white)
                                    .clipped()
                                    .cornerRadius(30)
                            )
                            .clipShape(Rectangle())
                            .frame(width: 350, height: 200)
                    }
                        .offset(x: 0, y: showWindow ? 0 : -6000)
                }
            }
            .navigationTitle("My Family")
        }
    }
    
    private func toggleWindow() {
        showWindow = !showWindow
    }
}

struct ViewB_Previews: PreviewProvider {
    static var previews: some View {
        ViewB()
    }
}
