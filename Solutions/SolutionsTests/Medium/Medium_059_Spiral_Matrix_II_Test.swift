//
//  Medium_059_Spiral_Matrix_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/16/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_059_Spiral_Matrix_II_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_059_Spiral_Matrix_II"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: Int = 3
        let expected: [[Int]] = [
            [ 1, 2, 3 ],
            [ 8, 9, 4 ],
            [ 7, 6, 5 ]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 0
        let expected: [[Int]] = [
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 4
        let expected: [[Int]] = [
            [ 1, 2, 3, 4],
            [12,13,14, 5],
            [11,16,15, 6],
            [10, 9, 8, 7]
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: Int, expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_059_Spiral_Matrix_II_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result = Medium_059_Spiral_Matrix_II.generateMatrix(input)
            assertHelper(compareTwoDimensionIntArray(arr0: result, arr1: expected), problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Medium_059_Spiral_Matrix_II_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
