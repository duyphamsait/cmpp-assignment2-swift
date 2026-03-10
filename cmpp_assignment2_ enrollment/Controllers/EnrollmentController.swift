//
//  EnrollmentController.swift
//  cmpp_assignment2_enrollment
//
//  Created by Duy Pham on 2026-03-09.
//

import Foundation

enum MenuOption: Int {
    case addStudent = 1
    case removeStudent = 2
    case modifyStudent = 3
    case viewRecords = 4
    case exit = 0
}

final class EnrollmentController {
    
    private var studentList: [Student] = []
    private var nextStudentId: Int = 1001
    
    init() {
        studentList = MockDataLoader.loadStudents()
        
        if let maxId = studentList.map({ $0.studentId }).max() {
            nextStudentId = maxId + 1
        }
    }
    
    func run() {
        ConsoleView.displayHeader()
        
        var running = true
        
        while running {
            ConsoleView.displayMenu()
            
            let selection = InputHelper.readInt(prompt: "Enter selection: ")
            
            guard let option = MenuOption(rawValue: selection) else {
                print("Please pick from one of the listed options.")
                continue
            }
            
            switch option {
            case .addStudent:
                addStudent()
                
            case .removeStudent:
                removeStudent()
                
            case .modifyStudent:
                modifyStudent()
                
            case .viewRecords:
                viewRecords()
                
            case .exit:
                print("User Selected 'Exit'...")
                running = false
            }
        }
        
        print("Program Closed Successfully.")
    }
    
    private func addStudent() {
        print("\nEnter student information\n")
        
        let firstName = InputHelper.readString(prompt: "First name: ")
        let lastName = InputHelper.readString(prompt: "Last name: ")
        let dob = InputHelper.readString(prompt: "Date of birth: ")
        let gender = InputHelper.readString(prompt: "Gender: ")
        let gpa = InputHelper.readDouble(min: 0.0, max: 4.0, prompt: "GPA (0.0 - 4.0): ")
        let semester = InputHelper.readInt(min: 1, prompt: "Current semester: ")
        let program = InputHelper.readString(prompt: "Program name: ")
        let courses = InputHelper.readInt(min: 0, prompt: "Number of courses: ")
        
        let student = Student(
            studentId: nextStudentId,
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            programName: program,
            currentSemester: semester,
            noOfCourses: courses,
            dob: dob,
            gpa: gpa
        )
        
        studentList.append(student)
        nextStudentId += 1
        
        print("Student added successfully.\n")
    }
    
    private func removeStudent() {
        guard !studentList.isEmpty else {
            print("No students to remove.\n")
            return
        }
        
        let id = InputHelper.readInt(prompt: "Enter student ID to remove: ")
        
        if let index = findStudentIndex(by: id) {
            studentList.remove(at: index)
            print("Student removed successfully.\n")
        } else {
            print("Student ID not found.\n")
        }
    }
    
    private func modifyStudent() {
        guard !studentList.isEmpty else {
            print("No students available.\n")
            return
        }
        
        let id = InputHelper.readInt(prompt: "Enter student ID to modify: ")
        
        guard let index = findStudentIndex(by: id) else {
            print("Student not found.\n")
            return
        }
        
        var editing = true
        
        while editing {
            ConsoleView.displayModifyMenu()
            
            let choice = InputHelper.readInt(prompt: "Select field: ")
            
            switch choice {
            case 1:
                studentList[index].firstName = InputHelper.readString(prompt: "New first name: ")
                
            case 2:
                studentList[index].lastName = InputHelper.readString(prompt: "New last name: ")
                
            case 3:
                studentList[index].dob = InputHelper.readString(prompt: "New DOB: ")
                
            case 4:
                studentList[index].gender = InputHelper.readString(prompt: "New gender: ")
                
            case 5:
                studentList[index].gpa = InputHelper.readDouble(min: 0.0, max: 4.0, prompt: "New GPA: ")
                
            case 6:
                studentList[index].currentSemester = InputHelper.readInt(min: 1, prompt: "New semester: ")
                
            case 7:
                studentList[index].programName = InputHelper.readString(prompt: "New program: ")
                
            case 8:
                studentList[index].noOfCourses = InputHelper.readInt(min: 0, prompt: "New course count: ")
                
            case 0:
                editing = false
                print("Modification completed.\n")
                
            default:
                print("Invalid choice.")
            }
        }
    }
    
    private func viewRecords() {
        ConsoleView.displayStudents(studentList, mode: .table)
    }
    
    private func findStudentIndex(by id: Int) -> Int? {
        for (index, student) in studentList.enumerated() {
            if student.studentId == id {
                return index
            }
        }
        return nil
    }
}
