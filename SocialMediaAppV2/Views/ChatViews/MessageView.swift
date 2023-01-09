//
//  MessageView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
        VStack(alignment: message.received ? .trailing : .leading) {
            Text(message.text)
                .padding()
                .background(message.received ? Color("Gray") : Color("Peach"))
                .cornerRadius(30)
                .frame(maxWidth:300, alignment: message.received ? .trailing : .leading)
            Text("\(formatDate(date: message.date))").font(.caption2).padding(message.received ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .trailing : .leading)
        .padding(message.received ? .trailing : .leading)
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        if let dateObj = dateFormatter.date(from: "\(date)") {
            dateFormatter.dateFormat = "HH:mm" // or "hh:mm a"
            //print("Dateobj: \(dateFormatter.string(from: dateObj))")
            return dateFormatter.string(from:dateObj)
        }
        return ""
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message())
    }
}
