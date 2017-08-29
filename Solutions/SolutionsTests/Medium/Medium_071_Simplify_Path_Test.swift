//
//  Medium_071_Simplify_Path_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/28/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_071_Simplify_Path_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: String = "/a/./b"
        let expected: String = "/a/b"
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: String = "/home/"
        let expected: String = "/home"
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: String = "/a/./b/../../c/"
        let expected: String = "/c"
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: String = "/a/./b/"
        let expected: String = "/a/b"
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: String = "/a/./b/.."
        let expected: String = "/a"
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: String = "/a/./b/../.."
        let expected: String = "/"
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: String = "/home//foo/"
        let expected: String = "/home/foo"
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: String = "/a/./b/../"
        let expected: String = "/a"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: String, expected: String) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_071_Simplify_Path.simplifyPath(input)
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
