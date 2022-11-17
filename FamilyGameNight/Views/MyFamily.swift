//
//  ViewB.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI

struct ViewB: View {
    private var data: [Int] = Array(1...4)
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    
    private let familyMembers: [String] = ["John", "Olivia", "Jesse", "Tom"]
    
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
