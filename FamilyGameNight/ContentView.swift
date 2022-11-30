//
//  ContentView.swift
//  FamilyGameNight
//
//  Created by Mette Ghijsen on 17/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                ViewA()
                    .tabItem() {
                        Image(systemName: "safari.fill")
                        Text("Wheel of Fortune")
                    }
                ViewC()
                    .tabItem() {
                        Image(systemName: "books.vertical.fill")
                        Text("Library")
                    }
                ViewB()
                    .tabItem() {
                        Image(systemName: "person.2.fill")
                        Text("My Family")
                    }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
