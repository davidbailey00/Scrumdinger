//
//  ContentView.swift
//  Scrumdinger
//
//  Created by David Bailey on 25/12/2020.
//

import AVFoundation
import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer: ScrumTimer
    var player: AVPlayer { AVPlayer.sharedDingPlayer }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.color)
            VStack {
                MeetingHeaderView(secondsElapsed: $scrumTimer.secondsElapsed, secondsRemaining: $scrumTimer.secondsRemaining)
                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                MeetingFooterView(speakers: $scrumTimer.speakers, activeSpeaker: $scrumTimer.activeSpeaker, skipAction: scrumTimer.skipSpeaker)
            }
            .foregroundColor(scrum.color.accessibleFontColor)
            .progressViewStyle(LinearProgressViewStyle(tint: scrum.color.accessibleFontColor))
            .padding()
        }
        .padding()
        .onAppear {
            scrumTimer.startScrum()
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
        .navigationTitle("\(scrum.title) Meeting")
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MeetingView(scrum: .constant(DailyScrum.data[0]), scrumTimer: DailyScrum.data[2].timer)
        }
    }
}
