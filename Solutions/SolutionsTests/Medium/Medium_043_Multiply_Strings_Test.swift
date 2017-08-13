//
//  Medium_043_Multiply_Strings_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/22/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_043_Multiply_Strings_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_043_Multiply_Strings"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 10
    func test_001() {
        let input: [String] = ["123", "9876"]
        let expected: String = "1214748"
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String] = ["123", "00000"]
        let expected: String = "0"
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String] = ["9046720578679481304827107845738", "7307858291070163424907"]
        let expected: String = "66112151987897914185037067763780539471710428702996366"
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [String] = ["0", "0"]
        let expected: String = "0"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [String], expected: String) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result: String = Medium_043_Multiply_Strings.multiply(num1: input[0], num2: input[1])
            assertHelper(expected == result, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Medium_043_Multiply_Strings_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
