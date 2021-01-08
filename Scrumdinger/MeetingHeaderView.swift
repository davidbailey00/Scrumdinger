//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by David Bailey on 07/01/2021.
//

import SwiftUI

struct MeetingHeaderView: View {
    @Binding var secondsElapsed: Int
    @Binding var secondsRemaining: Int
    private var progress: Double {
        return Double(secondsElapsed) / Double(secondsElapsed + secondsRemaining)
    }
    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Seconds elapsed"))
                .accessibilityValue(Text("\(secondsElapsed)"))
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    HStack {
                        Text("\(secondsRemaining)")
                        Image(systemName: "hourglass.tophalf.fill")
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Seconds remaining"))
                .accessibilityValue(Text("\(secondsRemaining)"))
            }
        }
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: .constant(60), secondsRemaining: .constant(180))
            .previewLayout(.sizeThatFits)
    }
}
