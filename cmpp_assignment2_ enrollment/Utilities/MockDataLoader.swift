//
//  MockDataLoader.swift
//  cmpp_assignment2_enrollment
//
//  Created by Duy Pham on 2026-03-09.
//

import Foundation

enum MockDataLoader {
    
    static func loadStudents() -> [Student] {
        return mockStudents()
    }
    
    private static func mockStudents() -> [Student] {
        return [
            Student(
                studentId: 1001,
                firstName: "John",
                lastName: "Smith",
                gender: "Male",
                programName: "Software Development",
                currentSemester: 2,
                noOfCourses: 5,
                dob: "2001-05-10",
                gpa: 3.45
            ),
            
            Student(
                studentId: 1002,
                firstName: "Anna",
                lastName: "Tran",
                gender: "Female",
                programName: "Information Technology",
                currentSemester: 3,
                noOfCourses: 4,
                dob: "2000-11-22",
                gpa: 3.90
            ),
            
            Student(
                studentId: 1003,
                firstName: "David",
                lastName: "Nguyen",
                gender: "Male",
                programName: "Computer Science",
                currentSemester: 1,
                noOfCourses: 6,
                dob: "2002-03-14",
                gpa: 3.20
            )
        ]
    }
}
