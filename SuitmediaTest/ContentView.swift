//
//  ContentView.swift
//  SuitmediaTest
//
//  Created by Farih Muhammad on 17/07/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var selectedUser = ""

    var body: some View {
        NavigationStack {
            FirstScreenView(name: $name, selectedUser: $selectedUser)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
