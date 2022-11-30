//
//  ViewB.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI

struct ViewB: View {
    static var wheelRed = Color("wheelRed")
    static var wheelYellow = Color("wheelYellow")
    static var wheelGreen = Color("wheelGreen")
    static var wheelBlue = Color("wheelBlue")
    static var wheelOrange = Color("wheelOrange")
    static var wheelPurple = Color("wheelPurple")
    
    private var data: [Int] = Array(1...familyMembers.count)
    private let colors: [Color] = [Color("wheelRed"), Color("wheelGreen"), Color("wheelBlue"), Color("wheelYellow"), Color("wheelOrange"), Color("wheelPurple")]
    
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: adaptiveColumns, spacing: 20){
                    ForEach(data, id: \.self){ number in
                        ZStack{
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundColor(colors[number%4])
                                .cornerRadius(30)
                            VStack{
                                Image(systemName: "person.crop.circle.fill")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 80))
                                Text(familyMembers[number%4])
                                    .foregroundColor(Color.white)
                                    .font(.system(size:20, weight: .bold, design:
                                            .rounded))
                            }
                        }
                    }
                }
            }
            .navigationTitle("My Family")
        }
    }
}

struct ViewB_Previews: PreviewProvider {
    static var previews: some View {
        ViewB()
    }
}
