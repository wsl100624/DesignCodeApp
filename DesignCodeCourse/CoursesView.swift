//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Will Wang on 9/6/20.
//

import SwiftUI

struct CoursesView: View {
    
    @State private var show = false
    @Namespace var namespace
    @State private var selectedCourse: Course?
    @State private var isDisabled = false
    
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ForEach(courses) { course in
                        
                        CourseItem(course: course)
                            .matchedGeometryEffect(id: course.id, in: namespace, isSource: !show)
                            .frame(width: 335, height: 250)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    show.toggle()
                                    selectedCourse = course
                                    isDisabled = true
                                }
                            }
                            .disabled(isDisabled)
                    }
                }.frame(maxWidth: .infinity)
            }
            
            
            if selectedCourse != nil {
                ScrollView {
                    CourseItem(course: selectedCourse!)
                        .matchedGeometryEffect(id: selectedCourse!.id, in: namespace)
                        .frame(height: 300)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                show.toggle()
                                selectedCourse = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    isDisabled = false
                                }
                            }
                        }
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                                .padding()
                        }
                    }
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion: AnyTransition.opacity
                                    .animation(Animation.spring().delay(0.3)),
                        removal: AnyTransition.opacity
                            .animation(.spring()))
                )
                .edgesIgnoringSafeArea(.all)
            }
            
            
        }
        
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
