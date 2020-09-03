import Foundation
import OpenCombine

import XCTest
@testable import XKCDClient

final class XKCDClientTests: XCTestCase {
    var cancellables: Set<AnyCancellable>!
    var xkcd: XKCD!

    override func setUp() {
        cancellables = []
        xkcd = XKCD()
    }

    func testGetComic() {
        let receivedComic = expectation(description: "comic received")

        xkcd.getComic(number: 614)
            .sink(
                receiveCompletion: { value in
                    // do nothing
                },
                receiveValue: { comic in
                    XCTAssertEqual(comic.num, 614)
                    XCTAssertEqual(comic.title, "Woodpecker")

                    receivedComic.fulfill()
                }
            )
            .store(in: &cancellables)

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testGetCurrentComic() {
        let receivedComic = expectation(description: "comic received")

        xkcd.getCurrentComic()
            .sink(
                receiveCompletion: { value in
                    // do nothing
                },
                receiveValue: { comic in
                    receivedComic.fulfill()
                }
            )
            .store(in: &cancellables)

        waitForExpectations(timeout: 1, handler: nil)
    }

    static var allTests = [
        ("testGetComic", testGetComic),
        ("testGetCurrentComic", testGetCurrentComic),
    ]
}
