//
//  NotificationsTabView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI

struct NotificationsTabView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...10, id:\.self) { _ in
                    NotificationRowView()
                    Divider()
                }
            }
        }
    }
}

struct NotificationsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsTabView()
    }
}
