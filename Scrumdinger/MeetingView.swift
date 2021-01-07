//
//  ContentView.swift
//  Scrumdinger
//
//  Created by David Bailey on 25/12/2020.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer: ScrumTimer
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.color)
            VStack {
                MeetingHeaderView(secondsElapsed: $scrumTimer.secondsElapsed, secondsRemaining: $scrumTimer.secondsRemaining)
                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                }
            }
            .foregroundColor(scrum.color.accessibleFontColor)
            .progressViewStyle(LinearProgressViewStyle(tint: scrum.color.accessibleFontColor))
            .padding()
        }
        .padding()
        .onAppear {
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]), scrumTimer: DailyScrum.data[2].timer)
    }
}
