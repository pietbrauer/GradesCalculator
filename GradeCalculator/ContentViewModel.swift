//
//  ContentViewModel.swift
//  GradeCalculator
//
//  Created by Piet Brauer-Kallenberg on 21.07.21.
//

import Foundation

class ContentViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var rise = ""
    @Published var length = ""
    @Published var gradeInPercent: Float = 0.0

    var formattedGradeInPercent: String {
        "\(formatter.string(from: NSNumber(value: gradeInPercent)) ?? "–") %"
    }

    // MARK: - Private Properties

    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.notANumberSymbol = "-"
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .halfUp
        return formatter
    }()

    // MARK: - Public Methods

    func calculate() {
        guard let rise = Float(rise), let length = Float(length),
              let grade = CalculatorService.calculatePercentage(rise: rise, length: length) else { return }
        gradeInPercent = grade
    }
}
