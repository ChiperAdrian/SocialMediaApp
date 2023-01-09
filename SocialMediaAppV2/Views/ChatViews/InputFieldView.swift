//
//  InputFieldView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI

struct InputFieldView: View {
    //var viewModel: ViewModel
    @State var message: String = ""
    
    var body: some View {
        HStack {
            TextField("Enter your message", text: $message)
            Button {
                //viewModel.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding()
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldView()
    }
}
