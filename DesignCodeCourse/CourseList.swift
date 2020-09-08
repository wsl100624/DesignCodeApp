//
//  CourseList.swift
//  DesignCodeCourse
//
//  Created by Will Wang on 9/7/20.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        List(0 ..< 20) { item in
            CourseRow()
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
