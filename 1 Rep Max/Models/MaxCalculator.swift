//
//  MaxCalculator.swift
//  1 Rep Max
//
//  Created by Mohammed Hossain on 11/23/20.
//

import Foundation

struct MaxCalculator {
    
    // Brzycki formula to calculate one rep max
    mutating func calculateMax(weight: Float, reps: Float) -> Float {
        
        return weight * (36 / (37 - reps))
        
    }

  
    // Function to calculate max weight that can be lifted for various reps
    mutating func calculateAllMax(oneRepMax: Float, reps: Float) -> Float {
        
        return oneRepMax*(37-reps) / 36
        
    }

    
    
}

