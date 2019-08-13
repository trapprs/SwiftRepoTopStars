//
//  Coordinator.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    @discardableResult func start() -> Self
    @discardableResult func add(childCoordinator: Coordinator) -> Coordinator
    @discardableResult func remove(childCoordinator: Coordinator) -> Coordinator
}

extension Coordinator {
    @discardableResult
    func add(childCoordinator: Coordinator) -> Coordinator {
        self.childCoordinators.append(childCoordinator)
        return childCoordinator
    }
    @discardableResult
    func remove(childCoordinator: Coordinator) -> Coordinator {
        self.childCoordinators.removeAll { $0 === childCoordinator }
        return childCoordinator
    }
}
