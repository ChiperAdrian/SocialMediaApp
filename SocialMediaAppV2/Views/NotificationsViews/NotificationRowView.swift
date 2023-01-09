//
//  NotificationRowView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI

struct NotificationRowView: View {
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Circle().frame(width:25, height:25)
                    Text("Adrian").font(.subheadline).bold().foregroundColor(.black)
                    Text("@plato").font(.caption).foregroundColor(.gray)
                    Text("2w").font(.caption).foregroundColor(.gray)
                }
                Text("Just shared an image")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.leading,60)
            }
            Spacer()
        }
    }
}

struct NotificationRowView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRowView()
    }
}

