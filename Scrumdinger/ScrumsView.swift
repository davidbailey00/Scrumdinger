//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by David Bailey on 28/12/2020.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State private var presentEditView = false
    @State private var newScrumData = DailyScrum.Data()

    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
            .onDelete { indices in
                scrums.remove(atOffsets: indices)
            }
        }
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: {
            presentEditView = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $presentEditView) {
            NavigationView {
                EditView(scrumData: $newScrumData)
                    .navigationTitle("New Scrum")
                    .navigationBarItems(leading: Button("Cancel") {
                        presentEditView = false
                    }, trailing: Button("Add") {
                        let newScrum = DailyScrum(title: newScrumData.title, attendees: newScrumData.attendees,
                                                  lengthInMinutes: Int(newScrumData.lengthInMinutes), color: newScrumData.color)
                        scrums.append(newScrum)
                        newScrumData = DailyScrum.Data()
                        presentEditView = false
                    })
            }
        }
    }

    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        let index = scrums.firstIndex(where: { $0.id == scrum.id })!
        return $scrums[index]
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
