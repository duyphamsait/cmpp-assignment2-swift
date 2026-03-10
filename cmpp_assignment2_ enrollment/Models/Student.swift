//
//  Student.swift
//  cmpp_assignment2_enrollment
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

struct Student: Codable {
    var studentId: Int
    var firstName: String
    var lastName: String
    var gender: String
    var programName: String
    var currentSemester: Int
    var noOfCourses: Int
    var dob: String
    var gpa: Double
}

extension Student {
    
    func display(recordNumber: Int) -> String {
        return """
        
        Record #\(recordNumber)
        Student ID       : \(studentId)
        First Name       : \(firstName)
        Last Name        : \(lastName)
        Date of Birth    : \(dob)
        Gender           : \(gender)
        GPA              : \(String(format: "%.2f", gpa))
        Current Semester : \(currentSemester)
        Program          : \(programName)
        Number of Courses: \(noOfCourses)
        """
    }
    
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
    
    func tableRow(recordNumber: Int) -> String {
        return
            "\(recordNumber)".pad(4) +
            "\(studentId)".pad(8) +
            firstName.pad(15) +
            lastName.pad(15) +
            dob.pad(14) +
            gender.pad(10) +
            String(format: "%.2f", gpa).pad(8) +
            programName.pad(25) +
            "\(noOfCourses)"
    }
}
