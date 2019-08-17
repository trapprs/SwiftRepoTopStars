//
//  APIErrorTests.swift
//  SwiftTopStarsTests
//
//  Created by Renan Trapp Silva on 17/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import XCTest
@testable import SwiftTopStars

class APIErrorTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testAPIError() {
        XCTAssert(APIError.invalidData.localizedError == "invalidData")
        XCTAssert(APIError.requestFailed.localizedError == "requestFailed")
        XCTAssert(APIError.jsonConversionFailure.localizedError == "jsonConversionFailure")
        XCTAssert(APIError.responseUnsuccessful.localizedError == "responseUnsuccessful")
        XCTAssert(APIError.jsonParsingFailure.localizedError == "jsonParsingFailure")
    }
}
