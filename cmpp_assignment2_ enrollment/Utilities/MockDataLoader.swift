//
//  MockDataLoader.swift
//  cmpp_assignment2_enrollment
//
//  Created by Duy Pham on 2026-03-09.
//

import Foundation

enum MockDataLoader {
    
    static func loadStudents() -> [Student] {
        return MockDataLoader.mockStudents()
    }
    
    
    private static func mockStudents() -> [Student] {
        
        return [
            
            Student(
                studentId: 1001,
                firstName: "John",
                lastName: "Smith",
                dateOfBirth: "2001-05-10",
                gender: "Male",
                previousGPA: 3.45,
                currentSemester: 2,
                programName: "Software Development",
                numberOfCourses: 5
            ),
            
            Student(
                studentId: 1002,
                firstName: "Anna",
                lastName: "Tran",
                dateOfBirth: "2000-11-22",
                gender: "Female",
                previousGPA: 3.90,
                currentSemester: 3,
                programName: "Information Technology",
                numberOfCourses: 4
            ),
            
            Student(
                studentId: 1003,
                firstName: "David",
                lastName: "Nguyen",
                dateOfBirth: "2002-03-14",
                gender: "Male",
                previousGPA: 3.20,
                currentSemester: 1,
                programName: "Computer Science",
                numberOfCourses: 6
            )
        ]
    }
    
}
