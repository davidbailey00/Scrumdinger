//
//  DetailView.swift
//  Scrumdinger
//
//  Created by David Bailey on 30/12/2020.
//

import SwiftUI
import Typographizer

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    @State private var presentEditView = false

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "circle.fill")
                        .foregroundColor(scrum.color)
                        .accessibilityHidden(true)
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) {attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
            presentEditView = true
            data = scrum.data
        })
        .navigationTitle(scrum.title)
        .sheet(isPresented: $presentEditView) {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle("Edit \"\(scrum.title)\"".typographized(language: "en"))
                    .navigationBarItems(leading: Button("Cancel") {
                        presentEditView = false
                    }, trailing: Button("Done") {
                        presentEditView = false
                        scrum.update(from: data)
                    })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
