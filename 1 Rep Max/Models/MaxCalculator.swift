//
//  MaxCalculator.swift
//  1 Rep Max
//
//  Created by Mohammed Hossain on 11/23/20.
//

import Foundation

struct MaxCalculator {
    
    // Brzycki formula to calculate one rep max
    mutating func calculateMax(weight:Int, reps: Int) -> Double {
    
        return Double(weight * (36/(37 - reps)))
        
    }
    
   
    
    
    
    
}
