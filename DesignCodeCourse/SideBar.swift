//
//  SideBar.swift
//  DesignCodeCourse
//
//  Created by Will Wang on 9/6/20.
//

import SwiftUI

struct SideBar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
            #else
            // TODO setup for iPadOS/MacOS
            #endif
        }
    }
    
    var content: some View {
        List {
            NavigationLink(destination: CoursesView()) {
                Label("Courses", systemImage: "book.closed")
            }
            NavigationLink(destination: CoursesView()) {
                Label("Tutorials", systemImage: "list.bullet.rectangle")
            }
            NavigationLink(destination: CoursesView()) {
                Label("Livestreams", systemImage: "tv")
            }
            NavigationLink(destination: CoursesView()) {
                Label("Certificates", systemImage: "mail.stack")
            }
            NavigationLink(destination: CoursesView()) {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Learn")

    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
