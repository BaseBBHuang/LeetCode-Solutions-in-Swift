//
//  Medium_094_Binary_Tree_Inorder_Traversal_Test.swift
//  Solutions
//
//  Created by Di Wu on 11/4/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_094_Binary_Tree_Inorder_Traversal_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_094_Binary_Tree_Inorder_Traversal"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node_Swift = Medium_094_Binary_Tree_Inorder_Traversal.Node
    private typealias Node_ObjC = ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node
    func test_001() {
        let input_swift: Node_Swift = Node_Swift.init(value: 0, left: nil, right: nil)
        let input_objc: Node_ObjC = Node_ObjC.init(value: 0, left: nil, right: nil)
        let expected: [Int] = [
            0
        ]
        asyncHelper(input0: input_swift, input1: input_objc, expected: expected)
    }
    func test_002() {
        let expected: [Int] = [
        ]
        asyncHelper(input0: nil, input1: nil, expected: expected)
    }
    func test_003() {
        let input_swift_3: Node_Swift = Node_Swift.init(value: 3, left: nil, right: nil)
        let input_swift_2: Node_Swift = Node_Swift.init(value: 2, left: input_swift_3, right: nil)
        let input_swift: Node_Swift = Node_Swift.init(value: 1, left: nil, right: input_swift_2)
        let input_objc_3: Node_ObjC = Node_ObjC.init(value: 3, left: nil, right: nil)
        let input_objc_2: Node_ObjC = Node_ObjC.init(value: 2, left: input_objc_3, right: nil)
        let input_objc: Node_ObjC = Node_ObjC.init(value: 1, left: nil, right: input_objc_2)
        let expected: [Int] = [
            1, 3, 2
        ]
        asyncHelper(input0: input_swift, input1: input_objc, expected: expected)
    }
    func test_004() {
        let input_swift_4: Node_Swift = Node_Swift.init(value: 4, left: nil, right: nil)
        let input_swift_3: Node_Swift = Node_Swift.init(value: 3, left: nil, right: input_swift_4)
        let input_swift_2: Node_Swift = Node_Swift.init(value: 2, left: input_swift_3, right: nil)
        let input_swift: Node_Swift = Node_Swift.init(value: 1, left: nil, right: input_swift_2)
        let input_objc_4: Node_ObjC = Node_ObjC.init(value: 4, left: nil, right: nil)
        let input_objc_3: Node_ObjC = Node_ObjC.init(value: 3, left: nil, right: input_objc_4)
        let input_objc_2: Node_ObjC = Node_ObjC.init(value: 2, left: input_objc_3, right: nil)
        let input_objc: Node_ObjC = Node_ObjC.init(value: 1, left: nil, right: input_objc_2)
        let expected: [Int] = [
            1, 3, 4, 2
        ]
        asyncHelper(input0: input_swift, input1: input_objc, expected: expected)
    }
    private func asyncHelper(input0: Node_Swift?, input1: Node_ObjC?, expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_094_Binary_Tree_Inorder_Traversal_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result_swift: [Int] = Medium_094_Binary_Tree_Inorder_Traversal.inorderTraversal(input0)
            let result_objc: [NSNumber] = ObjC_Medium_094_Binary_Tree_Inorder_Traversal.inorderTraversal(input1)
            assertHelper(expected == result_swift, problemName:self.problemName(), input: input0 as Any, resultValue: result_swift, expectedValue: expected)
            var result_objc_Int = [Int]()
            for n in result_objc {
                result_objc_Int.append(n.intValue)
            }
            assertHelper(expected == result_objc_Int, problemName:self.problemName(), input: input0 as Any, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_094_Binary_Tree_Inorder_Traversal_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input0 as Any, resultValue: Medium_094_Binary_Tree_Inorder_Traversal_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
