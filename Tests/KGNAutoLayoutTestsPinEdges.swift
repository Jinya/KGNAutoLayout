//
//  KGNAutoLayoutTests.swift
//  KGNAutoLayoutTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNAutoLayout

class KGNAutoLayoutTestsPinEdges: KGNAutoLayoutTests {

    func testPinTopEdgeToTopEdgeOfItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinTopEdgeToTopEdge(ofItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.minY
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinTopEdgeToTopEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinTopEdgeToTopEdge(ofItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.minY+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinRightEdgeToRightEdgeOfItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinRightEdgeToRightEdge(ofItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.maxX-size.width
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinRightEdgeToRightEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinRightEdgeToRightEdge(ofItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.maxX-size.width-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinBottomEdgeToBottomEdgeOfItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinBottomEdgeToBottomEdge(ofItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.maxY-size.height
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinBottomEdgeToBottomEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinBottomEdgeToBottomEdge(ofItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.maxY-size.height-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinLeftEdgeToLeftEdge() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinLeftEdgeToLeftEdge(ofItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.minX
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinLeftEdgeToLeftEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinLeftEdgeToLeftEdge(ofItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.minX+offset
        XCTAssertEqual(childViewFrame, frame)
    }

}
