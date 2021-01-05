//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by David Bailey on 28/12/2020.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]

    var body: some View {
        List {
            ForEach(scrums.indices) { index in
                NavigationLink(destination: DetailView(scrum: $scrums[index])) {
                    CardView(scrum: scrums[index])
                }
                .listRowBackground(scrums[index].color)
            }
        }
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: {}) {
            Image(systemName: "plus")
        })
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
