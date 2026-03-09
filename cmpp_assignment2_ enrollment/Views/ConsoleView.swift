//
//  ConsoleView.swift
//  cmpp_assignment2_ enrollment
//
//  Created by Duy Pham on 2026-03-09.
//

import Foundation

enum DisplayMode {
    case detail
    case table
}

enum ConsoleView {
    
    static func displayHeader() {
        
        print("""
        =========================================
               Enrollment Management System
        =========================================
        """)
    }
    
    static func displayMenu() {
        
        print("""
        
        -------- Main Menu --------
        1. Add Student
        2. Remove Student
        3. Modify Student
        4. View Records
        0. Exit
        ---------------------------
        """)
    }
    
    static func displayModifyMenu() {
        
        print("""
        
        ---- Modify Student ----
        1. First Name
        2. Last Name
        3. Date of Birth
        4. Gender
        5. GPA
        6. Semester
        7. Program
        8. Number of Courses
        0. Done
        """)
    }
    
    static func displayStudents(_ students: [Student], mode: DisplayMode) {
        
        guard !students.isEmpty else {
            print("\nNo student records.\n")
            return
        }
        
        switch mode {
            
        case .detail:
            
            for (index, student) in students.enumerated() {
                print(student.display(recordNumber: index + 1))
            }
            
        case .table:
            
            print("\n================ Student Records ================\n")
            
            print(Student.tableHeader())
            print(String(repeating: "-", count: 110))
            
            for (index, student) in students.enumerated() {
                print(student.tableRow(recordNumber: index + 1))
            }
            
            print("\n")
        }
    }
}
