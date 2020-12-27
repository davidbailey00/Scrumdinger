//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by David Bailey on 27/12/2020.
//

import SwiftUI

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Jess", "Olga", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color("Design")),
            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, color: Color("App Dev")),
            DailyScrum(title: "Web Dev", attendees: ["David", "Jennifer", "James", "Bolaji"], lengthInMinutes: 1, color: Color("Web Dev")),
        ]
    }
}
