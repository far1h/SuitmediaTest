//
//  SecondScreenView.swift
//  SuitmediaTest
//
//  Created by Farih Muhammad on 17/07/2025.
//

import SwiftUI

struct SecondScreenView: View {
    @Binding var name: String
    @Binding var selectedUser: String
    @State private var showUserScreen = false

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(name)
                    .font(.title3)
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 24)

            Spacer()

            Text(selectedUser.isEmpty ? "Selected User Name" : selectedUser)
                .font(.title3)
                .bold()
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)

            Spacer()

            Button(action: {
                showUserScreen = true
            }) {
                Text("Choose a User")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(uiColor: UIColor(red: 43/255, green: 99/255, blue: 123/255, alpha: 1)))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 24)
        }
        .navigationTitle("Second Screen")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $showUserScreen) {
            ThirdScreenView(selectedUser: $selectedUser)
        }
    }
}

struct SecondScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenView(name: .constant("Farih Muhammad"), selectedUser: .constant("John Doe"))
    }
}
