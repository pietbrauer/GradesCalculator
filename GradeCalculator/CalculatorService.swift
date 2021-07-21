//
//  CalculatorService.swift
//  GradeCalculator
//
//  Created by Piet Brauer-Kallenberg on 21.07.21.
//

import Foundation

enum CalculatorService {
    /// Calculates the grade of a climb in percent
    /// - Parameters:
    ///   - rise: The meters of ascend on the climb
    ///   - length: The length of the climb in kilometers
    static func calculatePercentage(rise: Float, length: Float) -> Float? {
        guard rise > 0 && length > 0 else { return nil }
        let alpha = tan(rise / 1000 / length)
        return alpha * 100
    }
}
