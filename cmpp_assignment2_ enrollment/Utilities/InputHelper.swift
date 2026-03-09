//
//  InputHelper.swift
//  cmpp_assignment2_ enrollment
//
//  Created by Duy Pham on 2026-03-09.
//

import Foundation

import Foundation

enum InputHelper {
    
    static func readString(prompt: String) -> String {
        
        while true {
            
            print(prompt, terminator: "")
            
            if let input = readLine(),
               !input.trimmingCharacters(in: .whitespaces).isEmpty {
                
                return input
            }
            
            print("Invalid input. Please try again.")
        }
    }
    
    static func readInt(prompt: String) -> Int {
        
        while true {
            
            print(prompt, terminator: "")
            
            if let input = readLine(),
               let value = Int(input) {
                
                return value
            }
            
            print("Invalid number. Please enter an integer.")
        }
    }
    
    static func readInt(min: Int, prompt: String) -> Int {
        
        while true {
            
            let value = readInt(prompt: prompt)
            
            if value >= min {
                return value
            }
            
            print("Value must be >= \(min)")
        }
    }
    
    static func readDouble(min: Double, max: Double, prompt: String) -> Double {
        
        while true {
            
            print(prompt, terminator: "")
            
            if let input = readLine(),
               let value = Double(input),
               value >= min && value <= max {
                
                return value
            }
            
            print("Invalid GPA. Enter value between \(min) and \(max)")
        }
    }
}
