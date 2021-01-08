//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by David Bailey on 07/01/2021.
//

import SwiftUI

struct MeetingFooterView: View {
    @Binding var speakers: [ScrumTimer.Speaker]
    @Binding var activeSpeaker: String?
    var skipAction: () -> Void
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }

    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }

    private var speakerText: String {
        guard let speakerNumber = speakerNumber,
              let activeSpeaker = activeSpeaker else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count): \(activeSpeaker)"
    }

    var body: some View {
        HStack {
            Text(speakerText)
            Spacer()
            Button(action: skipAction) {
                Image(systemName: "forward.fill")
            }
            .accessibilityLabel(Text("Next speaker"))
        }
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var speakers = DailyScrum.data[0].timer.speakers
    static var activeSpeaker = DailyScrum.data[0].timer.activeSpeaker
    static var previews: some View {
        MeetingFooterView(speakers: .constant(speakers), activeSpeaker: .constant(activeSpeaker), skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
