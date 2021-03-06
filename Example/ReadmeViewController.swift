//
//  ReadmeViewController.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/23/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

// To generate the images @1x use the iPad 2 simulator

import UIKit
import KGNAutoLayout

class ReadmeViewController: UIViewController {

    let snapshots: [String] = [
        "Pin: Superview - pinToEdgesOfSuperview_offset20:",
        "Pin: Superview - pinToTopEdgeOfSuperview_offset20:",
        "Pin: Superview - pinToRightEdgeOfSuperview_offset20:",
        "Pin: Superview - pinToBottomEdgeOfSuperview_offset20:",
        "Pin: Superview - pinToLeftEdgeOfSuperview_offset20:",
        "Pin: Superview - pinToSideEdgesOfSuperview_offset20:",
        "Pin: Superview - pinToTopAndBottomEdgesOfSuperview_offset20:",

        "Pin: Edges - pinTopEdgeToTopEdgeOfItem_offset20:",
        "Pin: Edges - pinRightEdgeToRightEdgeOfItem_offset20:",
        "Pin: Edges - pinBottomEdgeToBottomEdgeOfItem_offset20:",
        "Pin: Edges - pinLeftEdgeToLeftEdgeOfItem_offset20:",

        "Center - centerInSuperview:",
        "Center - centerHorizontallyInSuperview:",
        "Center - centerVerticallyInSuperview:",
        "Center - centerViewsHorizontally_separation20:",
        "Center - centerViewsVertically_separation20:",
        "Center - centerHorizontallyToItem:",
        "Center - centerVerticallyToItem:",

        "Size - sizeToWidth80:",
        "Size - sizeToMinWidth40:",
        "Size - sizeToMaxWidth100:",
        "Size - sizeToHeight80:",
        "Size - sizeToMinHeight40:",
        "Size - sizeToMaxHeight100:",
        "Size - sizeToWidthAndHeight80:",
        "Size - sizeToMinWidthAndHeight40:",
        "Size - sizeToMaxWidthAndHeight100:",
        "Size - sizeWidthToWidthOfItem:",
        "Size - sizeHeightToHeightOfItem:",
        "Size - sizeHeightToWidthOfItem:",
        "Size - sizeWidthToHeightOfItem:",
        "Size - sizeWidthAndHeightToWidthAndHeightOfItem:",
        "Size - sizeHeightToWidthAspectRatio16by9:",
        "Size - sizeWidthToHeightAspectRatio16by9:",

        "Position - positionAboveItem_offset20:",
        "Position - positionToTheRightOfItem_offset20:",
        "Position - positionBelowItem_offset20:",
        "Position - positionToTheLeftOfItem_offset20:",
        "Position - positionViewsAbove_offset20:",
        "Position - positionViewsToTheRight_offset20:",
        "Position - positionViewsBelow_offset20:",
        "Position - positionViewsToTheLeft_offset20:",

        "Between - fitBetweenTopAndBottomItems_offset20:",
        "Between - fitBetweenLeftAndRightItems_offset20:",

        "Fill - fillHorizontally_separation20:",
        "Fill - fillVertically_separation20:",

        "Bound - boundHorizontally_separation20:",
        "Bound - boundVertically_separation20:"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        var lastTitle: String!
        for snapshot in self.snapshots {
            let values = snapshot.split{$0 == "-"}.map(String.init)
            let title = values.first!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            let selector = values.last!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

            if title != lastTitle {
                print("### \(title)")
                lastTitle = title
            }

            let snapshotView = SnapshotView()
            self.view.addSubview(snapshotView)
            snapshotView.centerInSuperview()
            self.perform(Selector(selector), with: snapshotView)
            snapshotView.removeFromSuperview()
        }
        print("Cache Directory: \(SnapshotView.cacheDirectory())")
    }

    // MARK: - Pin: Superview

    @objc func pinToEdgesOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToEdgesOfSuperview(withOffset: 20)

        let topSpringView = SpringView()
        topSpringView.direction = .vertical
        parentView.addSubview(topSpringView)
        topSpringView.pinToTopEdgeOfSuperview()
        topSpringView.positionAbove(view)
        topSpringView.centerHorizontallyInSuperview()

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRight(of: view)
        rightSpringView.pinToRightEdgeOfSuperview()
        rightSpringView.centerVerticallyInSuperview()

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.pinToBottomEdgeOfSuperview()
        bottomSpringView.positionBelow(view)
        bottomSpringView.centerHorizontallyInSuperview()

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.pinToLeftEdgeOfSuperview()
        leftSpringView.positionToTheLeft(of: view)
        leftSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToEdgesOfSuperview(withOffset: 20)"
        )
    }

    @objc func pinToTopEdgeOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopEdgeOfSuperview(withOffset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidthAndHeight: 160)

        let topSpringView = SpringView()
        topSpringView.direction = .vertical
        parentView.addSubview(topSpringView)
        topSpringView.pinToTopEdgeOfSuperview()
        topSpringView.positionAbove(view)
        topSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToTopEdgeOfSuperview(withOffset: 20)"
        )
    }

    @objc func pinToRightEdgeOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToRightEdgeOfSuperview(withOffset: 20)
        view.centerVerticallyInSuperview()
        view.size(toWidthAndHeight: 160)

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRight(of: view)
        rightSpringView.pinToRightEdgeOfSuperview()
        rightSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToRightEdgeOfSuperview(withOffset: 20)"
        )
    }

    @objc func pinToBottomEdgeOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToBottomEdgeOfSuperview(withOffset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidthAndHeight: 160)

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.pinToBottomEdgeOfSuperview()
        bottomSpringView.positionBelow(view)
        bottomSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToBottomEdgeOfSuperview(withOffset: 20)"
        )
    }

    @objc func pinToLeftEdgeOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToLeftEdgeOfSuperview(withOffset: 20)
        view.centerVerticallyInSuperview()
        view.size(toWidthAndHeight: 160)

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.pinToLeftEdgeOfSuperview()
        leftSpringView.positionToTheLeft(of: view)
        leftSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToLeftEdgeOfSuperview(withOffset: 20)"
        )
    }

    @objc func pinToSideEdgesOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToSideEdgesOfSuperview(withOffset: 20)
        view.centerVerticallyInSuperview()
        view.size(toHeight: 100)

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRight(of: view)
        rightSpringView.pinToRightEdgeOfSuperview()
        rightSpringView.centerVerticallyInSuperview()

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.pinToLeftEdgeOfSuperview()
        leftSpringView.positionToTheLeft(of: view)
        leftSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToSideEdgesOfSuperview(withOffset: 20)"
        )
    }

    @objc func pinToTopAndBottomEdgesOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopAndBottomEdgesOfSuperview(withOffset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidth: 100)

        let topSpringView = SpringView()
        topSpringView.direction = .vertical
        parentView.addSubview(topSpringView)
        topSpringView.pinToTopEdgeOfSuperview()
        topSpringView.positionAbove(view)
        topSpringView.centerHorizontallyInSuperview()

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.pinToBottomEdgeOfSuperview()
        bottomSpringView.positionBelow(view)
        bottomSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToTopAndBottomEdgesOfSuperview(withOffset: 20)"
        )
    }

    // MARK: - Pin: Edges

    @objc func pinTopEdgeToTopEdgeOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()
        itemView.size(toWidthAndHeight: 60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinTopEdgeToTopEdge(of: itemView, withOffset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidth: 60)
        view.size(toHeight: 80)

        let springView = SpringView()
        springView.direction = .vertical
        parentView.addSubview(springView)
        springView.positionAbove(view)
        springView.pinTopEdgeToTopEdge(of: itemView)
        springView.centerHorizontally(to: view)

        parentView.saveSnapshot(#function,
            "view.pinTopEdgeToTopEdge(of: itemView, withOffset: 20)"
        )
    }

    @objc func pinRightEdgeToRightEdgeOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()
        itemView.size(toWidthAndHeight: 60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinRightEdgeToRightEdge(of: itemView, withOffset: 20)
        view.centerVerticallyInSuperview()
        view.size(toWidth: 80)
        view.size(toHeight: 60)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheRight(of: view)
        springView.pinRightEdgeToRightEdge(of: itemView)
        springView.centerVertically(to: view)

        parentView.saveSnapshot(#function,
            "view.pinRightEdgeToRightEdge(of: itemView, withOffset: 20)"
        )
    }

    @objc func pinBottomEdgeToBottomEdgeOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()
        itemView.size(toWidthAndHeight: 60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinBottomEdgeToBottomEdge(of: itemView, withOffset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidth: 60)
        view.size(toHeight: 80)

        let springView = SpringView()
        springView.direction = .vertical
        parentView.addSubview(springView)
        springView.positionBelow(view)
        springView.pinBottomEdgeToBottomEdge(of: itemView)
        springView.centerHorizontally(to: view)

        parentView.saveSnapshot(#function,
            "view.pinBottomEdgeToBottomEdge(of: itemView, withOffset: 20)"
        )
    }

    @objc func pinLeftEdgeToLeftEdgeOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()
        itemView.size(toWidthAndHeight: 60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinLeftEdgeToLeftEdge(of: itemView, withOffset: 20)
        view.centerVerticallyInSuperview()
        view.size(toWidth: 80)
        view.size(toHeight: 60)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheLeft(of: view)
        springView.pinLeftEdgeToLeftEdge(of: itemView)
        springView.centerVertically(to: view)

        parentView.saveSnapshot(#function,
            "view.pinLeftEdgeToLeftEdge(of: itemView, withOffset: 20)"
        )
    }

    // MARK: - Center

    @objc func centerInSuperview(_ parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()

        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toWidthAndHeight: 160)

        parentView.saveSnapshot(#function,
            "view.centerInSuperview()"
        )
    }

    @objc func centerHorizontallyInSuperview(_ parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerHorizontallyInSuperview()
        view.pinToTopEdgeOfSuperview()
        view.size(toWidthAndHeight: 160)

        parentView.saveSnapshot(#function,
            "view.centerHorizontallyInSuperview()"
        )
    }

    @objc func centerVerticallyInSuperview(_ parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerVerticallyInSuperview()
        view.pinToLeftEdgeOfSuperview()
        view.size(toWidthAndHeight: 160)

        parentView.saveSnapshot(#function,
            "view.centerVerticallyInSuperview()"
        )
    }

    @objc func centerViewsHorizontally_separation20(_ parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerVerticallyInSuperview()
        view1.size(toWidthAndHeight: 60)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerVerticallyInSuperview()
        view2.size(toWidthAndHeight: 80)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerVerticallyInSuperview()
        view3.size(toWidthAndHeight: 50)

        [view1, view2, view3].centerHorizontally(to: parentView, withSeparation: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.positionToTheRight(of: view1)
        springView1.positionToTheLeft(of: view2)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRight(of: view2)
        springView2.positionToTheLeft(of: view3)
        springView2.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "[view1, view2, view3].centerHorizontally(to: parentView, withSeparation: 20)"
        )
    }

    @objc func centerViewsVertically_separation20(_ parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()
        
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerHorizontallyInSuperview()
        view1.size(toWidthAndHeight: 60)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerHorizontallyInSuperview()
        view2.size(toWidthAndHeight: 80)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerHorizontallyInSuperview()
        view3.size(toWidthAndHeight: 50)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.positionBelow(view1)
        springView1.positionAbove(view2)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(view2)
        springView2.positionAbove(view3)
        springView2.centerHorizontallyInSuperview()

        [view1, view2, view3].centerVertically(to: parentView, withSeparation: 20)

        parentView.saveSnapshot(#function,
            "[view1, view2, view3].centerVertically(to: parentView, withSeparation: 20)"
        )
    }

    @objc func centerHorizontallyToItem(_ parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()

        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerHorizontallyInSuperview(withOffset: 40)
        itemView.size(toWidthAndHeight: 30)
        itemView.pinToBottomEdgeOfSuperview()

        verticalSpringView.centerHorizontally(to: itemView)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopEdgeOfSuperview(withOffset: 20)
        view.centerHorizontally(to: itemView)
        view.size(toWidth: 60)
        view.size(toHeight: 80)

        parentView.saveSnapshot(#function,
            "view.centerHorizontally(to: itemView)"
        )
    }

    @objc func centerVerticallyToItem(_ parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()

        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerVerticallyInSuperview(withOffset: 40)
        itemView.size(toWidthAndHeight: 30)
        itemView.pinToLeftEdgeOfSuperview()

        horizontalSpringView.centerVertically(to: itemView)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToRightEdgeOfSuperview(withOffset: 30)
        view.centerVertically(to: itemView)
        view.size(toWidth: 60)
        view.size(toHeight: 80)

        parentView.saveSnapshot(#function,
            "view.centerVertically(to: itemView)"
        )
    }

    // MARK: - Size

    @objc func sizeToWidth80(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidth: 80)
        view.size(toHeight: 100)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toWidth: 80)"
        )
    }

    @objc func sizeToMinWidth40(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toMinWidth: 40)
        view.size(toHeight: 100)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMinWidth: 40)"
        )
    }

    @objc func sizeToMaxWidth100(_ parentView: SnapshotView) {
        let view = LayoutView()
        view.intrinsicContentWidth = 200
        parentView.addSubview(view)
        view.size(toMaxWidth: 100)
        view.size(toHeight: 100)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMaxWidth: 100)"
        )
    }

    @objc func sizeToHeight80(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toHeight: 80)
        view.size(toWidth: 100)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toHeight: 80)"
        )
    }

    @objc func sizeToMinHeight40(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toMinHeight: 40)
        view.size(toWidth: 80)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMinHeight: 40)"
        )
    }

    @objc func sizeToMaxHeight100(_ parentView: SnapshotView) {
        let view = LayoutView()
        view.intrinsicContentHeight = 200
        parentView.addSubview(view)
        view.size(toMaxHeight: 100)
        view.size(toWidth: 100)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMaxHeight: 100)"
        )
    }

    @objc func sizeToWidthAndHeight80(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toWidthAndHeight: 80)"
        )
    }

    @objc func sizeToMinWidthAndHeight40(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toMinWidthAndHeight: 40)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMinWidthAndHeight: 40)"
        )
    }

    @objc func sizeToMaxWidthAndHeight100(_ parentView: SnapshotView) {
        let view = LayoutView()
        view.intrinsicContentWidth = 200
        view.intrinsicContentHeight = 200
        parentView.addSubview(view)
        view.size(toMaxWidthAndHeight: 100)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMaxWidthAndHeight: 100)"
        )
    }

    @objc func sizeWidthToWidthOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 100)
        itemView.size(toHeight: 60)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toHeight: 80)
        view.sizeWidthToWidth(of: itemView)

        let horizontalSpringView1 = SpringView()
        view.addSubview(horizontalSpringView1)
        horizontalSpringView1.pinToSideEdgesOfSuperview()
        horizontalSpringView1.centerVerticallyInSuperview()

        let horizontalSpringView2 = SpringView()
        itemView.addSubview(horizontalSpringView2)
        horizontalSpringView2.pinToSideEdgesOfSuperview()
        horizontalSpringView2.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeWidthToWidth(of: itemView)"
        )
    }

    @objc func sizeHeightToHeightOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 100)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toWidth: 80)
        view.sizeHeightToHeight(of: itemView)

        let verticalSpringView1 = SpringView()
        verticalSpringView1.direction = .vertical
        view.addSubview(verticalSpringView1)
        verticalSpringView1.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView1.centerHorizontallyInSuperview()

        let verticalSpringView2 = SpringView()
        verticalSpringView2.direction = .vertical
        itemView.addSubview(verticalSpringView2)
        verticalSpringView2.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView2.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeHeightToHeight(of: itemView)"
        )
    }

    @objc func sizeHeightToWidthOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 100)
        itemView.size(toHeight: 60)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toWidth: 80)
        view.sizeHeightToWidth(of: itemView)

        let itemViewHorizontalSpringView = SpringView()
        itemView.addSubview(itemViewHorizontalSpringView)
        itemViewHorizontalSpringView.pinToSideEdgesOfSuperview()
        itemViewHorizontalSpringView.centerVerticallyInSuperview()

        let viewHorizontalSpringView = SpringView()
        viewHorizontalSpringView.direction = .vertical
        view.addSubview(viewHorizontalSpringView)
        viewHorizontalSpringView.pinToTopAndBottomEdgesOfSuperview()
        viewHorizontalSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeHeightToWidth(of: itemView)"
        )
    }

    @objc func sizeWidthToHeightOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 100)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toHeight: 80)
        view.sizeWidthToHeight(of: itemView)

        let itemViewHorizontalSpringView = SpringView()
        itemViewHorizontalSpringView.direction = .vertical
        itemView.addSubview(itemViewHorizontalSpringView)
        itemViewHorizontalSpringView.pinToTopAndBottomEdgesOfSuperview()
        itemViewHorizontalSpringView.centerHorizontallyInSuperview()

        let viewHorizontalSpringView = SpringView()
        view.addSubview(viewHorizontalSpringView)
        viewHorizontalSpringView.pinToSideEdgesOfSuperview()
        viewHorizontalSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeWidthToHeight(of: itemView)"
        )
    }

    @objc func sizeWidthAndHeightToWidthAndHeightOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 100)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.sizeWidthAndHeightToWidthAndHeight(of: itemView)

        let itemViewHorizontalSpringView1 = SpringView()
        itemViewHorizontalSpringView1.direction = .vertical
        itemView.addSubview(itemViewHorizontalSpringView1)
        itemViewHorizontalSpringView1.pinToTopAndBottomEdgesOfSuperview()
        itemViewHorizontalSpringView1.centerHorizontallyInSuperview()

        let itemViewHorizontalSpringView2 = SpringView()
        itemView.addSubview(itemViewHorizontalSpringView2)
        itemViewHorizontalSpringView2.pinToSideEdgesOfSuperview()
        itemViewHorizontalSpringView2.centerVerticallyInSuperview()

        let viewHorizontalSpringView1 = SpringView()
        viewHorizontalSpringView1.direction = .vertical
        view.addSubview(viewHorizontalSpringView1)
        viewHorizontalSpringView1.pinToTopAndBottomEdgesOfSuperview()
        viewHorizontalSpringView1.centerHorizontallyInSuperview()

        let viewHorizontalSpringView2 = SpringView()
        view.addSubview(viewHorizontalSpringView2)
        viewHorizontalSpringView2.pinToSideEdgesOfSuperview()
        viewHorizontalSpringView2.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeWidthAndHeightToWidthAndHeight(of: itemView)"
        )
    }

    @objc func sizeHeightToWidthAspectRatio16by9(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidth: 100)
        view.sizeHeightToWidth(withAspectRatio: 16/9)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeHeightToWidth(withAspectRatio: 16/9)"
        )
    }

    @objc func sizeWidthToHeightAspectRatio16by9(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toHeight: 100)
        view.sizeWidthToHeight(withAspectRatio: 16/9)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeWidthToHeight(withAspectRatio: 16/9)"
        )
    }

    // MARK: - Position

    @objc func positionAboveItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidthAndHeight: 60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerHorizontallyInSuperview()
        view.positionAbove(itemView, withOffset: 20)

        let springView = SpringView()
        springView.direction = .vertical
        parentView.addSubview(springView)
        springView.positionBelow(view)
        springView.positionAbove(itemView)
        springView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.positionAbove(itemView, withOffset: 20)"
        )
    }

    @objc func positionToTheRightOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidthAndHeight: 60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerVerticallyInSuperview()
        view.positionToTheRight(of: itemView, withOffset: 20)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheRight(of: itemView)
        springView.positionToTheLeft(of: view)
        springView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.positionToTheRight(of: itemView, withOffset: 20)"
        )
    }

    @objc func positionBelowItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidthAndHeight: 60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerHorizontallyInSuperview()
        view.positionBelow(itemView, withOffset: 20)

        let springView = SpringView()
        springView.direction = .vertical
        parentView.addSubview(springView)
        springView.positionAbove(view)
        springView.positionBelow(itemView)
        springView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.positionBelow(itemView, withOffset: 20)"
        )
    }

    @objc func positionToTheLeftOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidthAndHeight: 60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerVerticallyInSuperview()
        view.positionToTheLeft(of: itemView, withOffset: 20)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheLeft(of: itemView)
        springView.positionToTheRight(of: view)
        springView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.positionToTheLeft(of: itemView, withOffset: 20)"
        )
    }

    @objc func positionViewsAbove_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 20)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.size(toWidth: 60)
        view1.size(toHeight: 20)
        view1.centerHorizontallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.size(toWidth: 60)
        view2.size(toHeight: 20)
        view2.centerHorizontallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.size(toWidth: 60)
        view3.size(toHeight: 20)
        view3.centerHorizontallyInSuperview()

        [view1, view2, view3].positionAbove(itemView, withOffset: 20)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.positionBelow(view1)
        springView1.positionAbove(view2)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(view2)
        springView2.positionAbove(view3)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .vertical
        parentView.addSubview(springView3)
        springView3.positionBelow(view3)
        springView3.positionAbove(itemView)
        springView3.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "[view1, view2, view3].positionAbove(itemView, withOffset: 20)"
        )
    }

    @objc func positionViewsToTheRight_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 20)
        itemView.size(toHeight: 60)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.size(toWidth: 20)
        view1.size(toHeight: 60)
        view1.centerVerticallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.size(toWidth: 20)
        view2.size(toHeight: 60)
        view2.centerVerticallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.size(toWidth: 20)
        view3.size(toHeight: 60)
        view3.centerVerticallyInSuperview()

        [view1, view2, view3].positionToTheRight(of: itemView, withOffset: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.positionToTheRight(of: itemView)
        springView1.positionToTheLeft(of: view1)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRight(of: view1)
        springView2.positionToTheLeft(of: view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheRight(of: view2)
        springView3.positionToTheLeft(of: view3)
        springView3.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "[view1, view2, view3].positionToTheRight(of: itemView, withOffset: 20)"
        )
    }

    @objc func positionViewsBelow_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 20)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.size(toWidth: 60)
        view1.size(toHeight: 20)
        view1.centerHorizontallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.size(toWidth: 60)
        view2.size(toHeight: 20)
        view2.centerHorizontallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.size(toWidth: 60)
        view3.size(toHeight: 20)
        view3.centerHorizontallyInSuperview()

        [view1, view2, view3].positionBelow(itemView, withOffset: 20)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.positionBelow(itemView)
        springView1.positionAbove(view1)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(view1)
        springView2.positionAbove(view2)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .vertical
        parentView.addSubview(springView3)
        springView3.positionBelow(view2)
        springView3.positionAbove(view3)
        springView3.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "[view1, view2, view3].positionBelow(itemView, withOffset: 20)"
        )
    }

    @objc func positionViewsToTheLeft_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 20)
        itemView.size(toHeight: 60)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.size(toWidth: 20)
        view1.size(toHeight: 60)
        view1.centerVerticallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.size(toWidth: 20)
        view2.size(toHeight: 60)
        view2.centerVerticallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.size(toWidth: 20)
        view3.size(toHeight: 60)
        view3.centerVerticallyInSuperview()

        [view1, view2, view3].positionToTheLeft(of: itemView, withOffset: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.positionToTheLeft(of: itemView)
        springView1.positionToTheRight(of: view3)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheLeft(of: view3)
        springView2.positionToTheRight(of: view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheLeft(of: view2)
        springView3.positionToTheRight(of: view1)
        springView3.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "[view1, view2, view3].positionToTheLeft(of: itemView, withOffset: 20)"
        )
    }

    // MARK: - Between

    @objc func fitBetweenTopAndBottomItems_offset20(_ parentView: SnapshotView) {
        let topView = ItemView()
        parentView.addSubview(topView)
        topView.pinToTopEdgeOfSuperview()
        topView.centerHorizontallyInSuperview()
        topView.size(toWidthAndHeight: 60)

        let bottomView = ItemView()
        parentView.addSubview(bottomView)
        bottomView.pinToBottomEdgeOfSuperview()
        bottomView.centerHorizontallyInSuperview()
        bottomView.size(toWidthAndHeight: 30)

        let view = LayoutView()
        parentView.addSubview(view)
        view.fitBetween(top: topView, andBottom: bottomView, withOffset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidth: 80)

        let topSpringView = SpringView()
        topSpringView.direction = .vertical
        parentView.addSubview(topSpringView)
        topSpringView.positionBelow(topView)
        topSpringView.positionAbove(view)
        topSpringView.centerHorizontally(to: view)

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.positionBelow(view)
        bottomSpringView.positionAbove(bottomView)
        bottomSpringView.centerHorizontally(to: view)

        parentView.saveSnapshot(#function,
            "view.fitBetween(top: topView, andBottom: bottomView, withOffset: 20)"
        )
    }

    @objc func fitBetweenLeftAndRightItems_offset20(_ parentView: SnapshotView) {
        let leftView = ItemView()
        parentView.addSubview(leftView)
        leftView.pinToLeftEdgeOfSuperview()
        leftView.centerVerticallyInSuperview()
        leftView.size(toWidthAndHeight: 60)

        let rightView = ItemView()
        parentView.addSubview(rightView)
        rightView.pinToRightEdgeOfSuperview()
        rightView.centerVerticallyInSuperview()
        rightView.size(toWidthAndHeight: 30)

        let view = LayoutView()
        parentView.addSubview(view)
        view.fitBetween(left: leftView, andRight: rightView, withOffset: 20)
        view.centerVerticallyInSuperview()
        view.size(toHeight: 80)

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.positionToTheRight(of: leftView)
        leftSpringView.positionToTheLeft(of: view)
        leftSpringView.centerVertically(to: view)

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRight(of: view)
        rightSpringView.positionToTheLeft(of: rightView)
        rightSpringView.centerVertically(to: view)

        parentView.saveSnapshot(#function,
            "view.fitBetween(left: leftView, andRight: rightView, withOffset: 20)"
        )
    }

    // MARK: - Fill

    @objc func fillHorizontally_separation20(_ parentView: SnapshotView) {
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerVerticallyInSuperview()
        view1.size(toHeight: 80)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerVerticallyInSuperview()
        view2.size(toHeight: 60)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerVerticallyInSuperview()
        view3.size(toHeight: 100)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.pinToLeftEdgeOfSuperview()
        springView1.positionToTheLeft(of: view1)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRight(of: view1)
        springView2.positionToTheLeft(of: view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheRight(of: view2)
        springView3.positionToTheLeft(of: view3)
        springView3.centerVerticallyInSuperview()

        let springView4 = SpringView()
        parentView.addSubview(springView4)
        springView4.positionToTheRight(of: view3)
        springView4.pinToRightEdgeOfSuperview()
        springView4.centerVerticallyInSuperview()

        parentView.fillHorizontally(withViews: [view1, view2, view3], separation: 20)

        parentView.saveSnapshot(#function,
            "parentView.fillHorizontally(withViews: [view1, view2, view3], separation: 20)"
        )
    }

    @objc func fillVertically_separation20(_ parentView: SnapshotView) {
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerHorizontallyInSuperview()
        view1.size(toWidth: 80)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerHorizontallyInSuperview()
        view2.size(toWidth: 60)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerHorizontallyInSuperview()
        view3.size(toWidth: 100)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.pinToTopEdgeOfSuperview()
        springView1.positionAbove(view1)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(view1)
        springView2.positionAbove(view2)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .vertical
        parentView.addSubview(springView3)
        springView3.positionBelow(view2)
        springView3.positionAbove(view3)
        springView3.centerHorizontallyInSuperview()

        let springView4 = SpringView()
        springView4.direction = .vertical
        parentView.addSubview(springView4)
        springView4.positionBelow(view3)
        springView4.pinToBottomEdgeOfSuperview()
        springView4.centerHorizontallyInSuperview()

        parentView.fillVertically(withViews: [view1, view2, view3], separation: 20)

        parentView.saveSnapshot(#function,
            "parentView.fillVertically(withViews: [view1, view2, view3], separation: 20)"
        )
    }

    // MARK: - Bound

    @objc func boundHorizontally_separation20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerInSuperview()
        itemView.size(toHeight: 160)

        let view1 = LayoutView()
        itemView.addSubview(view1)
        view1.centerVerticallyInSuperview()
        view1.size(toWidthAndHeight: 60)

        let view2 = LayoutView()
        itemView.addSubview(view2)
        view2.centerVerticallyInSuperview()
        view2.size(toWidthAndHeight: 30)

        let view3 = LayoutView()
        itemView.addSubview(view3)
        view3.centerVerticallyInSuperview()
        view3.size(toWidthAndHeight: 80)

        itemView.boundHorizontally(withViews: [view1, view2, view3], separation: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.pinLeftEdgeToLeftEdge(of: itemView)
        springView1.positionToTheLeft(of: view1)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRight(of: view1)
        springView2.positionToTheLeft(of: view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheRight(of: view2)
        springView3.positionToTheLeft(of: view3)
        springView3.centerVerticallyInSuperview()

        let springView4 = SpringView()
        parentView.addSubview(springView4)
        springView4.positionToTheRight(of: view3)
        springView4.pinRightEdgeToRightEdge(of: itemView)
        springView4.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "itemView.boundHorizontally(withViews: [view1, view2, view3], separation: 20)"
        )
    }

    @objc func boundVertically_separation20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerInSuperview()
        itemView.size(toWidth: 160)

        let view1 = LayoutView()
        itemView.addSubview(view1)
        view1.centerHorizontallyInSuperview()
        view1.size(toWidthAndHeight: 60)

        let view2 = LayoutView()
        itemView.addSubview(view2)
        view2.centerHorizontallyInSuperview()
        view2.size(toWidthAndHeight: 30)

        let view3 = LayoutView()
        itemView.addSubview(view3)
        view3.centerHorizontallyInSuperview()
        view3.size(toWidthAndHeight: 80)

        itemView.boundVertically(withViews: [view1, view2, view3], separation: 20)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.pinTopEdgeToTopEdge(of: itemView)
        springView1.positionAbove(view1)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(view1)
        springView2.positionAbove(view2)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .vertical
        parentView.addSubview(springView3)
        springView3.positionBelow(view2)
        springView3.positionAbove(view3)
        springView3.centerHorizontallyInSuperview()

        let springView4 = SpringView()
        springView4.direction = .vertical
        parentView.addSubview(springView4)
        springView4.positionBelow(view3)
        springView4.pinBottomEdgeToBottomEdge(of: itemView)
        springView4.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "itemView.boundVertically(withViews: [view1, view2, view3], separation: 20)"
        )
    }

}
