//
//  CardView.swift
//  Scrumdinger
//
//  Created by David Bailey on 27/12/2020.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .padding(.trailing)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue("\(scrum.attendees.count)")
                Label("\(scrum.lengthInMinutes) min", systemImage: "clock")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Meeting length"))
                    .accessibilityValue(Text("\(scrum.lengthInMinutes) minutes"))
                Spacer()
            }
            .font(.caption)
        }
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var previews: some View {
        VStack {
            CardView(scrum: scrum)
                .padding()
        }
        .background(scrum.color)
        .previewLayout(.fixed(width: 400, height: 60))
    }
}
