//
//  Student.swift
//  cmpp_assignment2_ enrollment
//
//  Created by Duy Pham on 2026-03-09.
//

import Foundation

extension String {
    func pad(_ width: Int) -> String {
        return self.padding(
            toLength: width,
            withPad: " ",
            startingAt: 0
        )
    }
}

struct Student:Codable {
    
    var studentId: Int
    var firstName: String
    var lastName: String
    var dateOfBirth: String
    var gender: String
    var previousGPA: Double
    var currentSemester: Int
    var programName: String
    var numberOfCourses: Int
}

extension Student {
    
    func display(recordNumber: Int) -> String {
        
        return """
        
        Record #\(recordNumber)
        Student ID       : \(studentId)
        First Name       : \(firstName)
        Last Name        : \(lastName)
        Date of Birth    : \(dateOfBirth)
        Gender           : \(gender)
        Previous GPA     : \(String(format: "%.2f", previousGPA))
        Current Semester : \(currentSemester)
        Program          : \(programName)
        Number of Courses: \(numberOfCourses)
        """
    }
    
    // MARK: - Table Header
    
    static func tableHeader() -> String {
        
        return
            "No".pad(4) +
            "ID".pad(8) +
            "FirstName".pad(15) +
            "LastName".pad(15) +
            "DOB".pad(14) +
            "Gender".pad(10) +
            "GPA".pad(8) +
            "Program".pad(25) +
            "Courses"
    }
    
    // MARK: - Table Row
    
    func tableRow(recordNumber: Int) -> String {
        return
            "\(recordNumber)".pad(4) +
            "\(studentId)".pad(8) +
            firstName.pad(15) +
            lastName.pad(15) +
            dateOfBirth.pad(14) +
            gender.pad(10) +
            String(format: "%.2f", previousGPA).pad(8) +
            programName.pad(25) +
            "\(numberOfCourses)"
    }
}
