//
//  GradeCalculatorTests.swift
//  GradeCalculatorTests
//
//  Created by Piet Brauer-Kallenberg on 21.07.21.
//

import XCTest
@testable import GradeCalculator

final class GradeCalculatorTests: XCTestCase {
    func testCalculation() {
        // Alpe d'Huez https://www.strava.com/segments/4629741
        XCTAssertEqual(CalculatorService.calculatePercentage(rise: 1048, length: 12.09), 8.690097)

        // Mont Ventoux https://www.strava.com/segments/10155434
        XCTAssertEqual(CalculatorService.calculatePercentage(rise: 1519, length: 21.34), 7.130134)

        // Box Hill Climb https://www.strava.com/segments/12744502
        XCTAssertEqual(CalculatorService.calculatePercentage(rise: 136, length: 3.01), 4.52135)
    }
}
