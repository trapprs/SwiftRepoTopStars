//
//  Dynamic.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

class Dynamic<Element> {
    typealias Listener = (Element) -> Void
    private(set) var listener: Listener?
    private(set) var onSetEvents: Int = 0

    public var value: Element {
        didSet {
            onSetEvents += 1
            callListener()
        }
    }
    
    init(_ value: Element) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        callListener()
    }
    
    func isBinded() -> Bool {
        return listener != nil
    }
    
    private func callListener() {
        if Thread.isMainThread {
            listener?(value)
        } else {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
}
