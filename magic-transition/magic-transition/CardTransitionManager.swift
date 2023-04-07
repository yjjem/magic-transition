//
//  CardTransitionManager.swift
//  magic-transition
//
//  Copyright (c) 2023 Jeremy All rights reserved.
    

import UIKit

enum CardTransitionType {
    case present
    case dismiss
}

final class CardTransitionManager: NSObject {
    let transitionDuration: Double = 0.8
    var transition: CardTransitionType = .present
    let shrinkDuration: Double = 0.2
}

extension CardTransitionManager: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.completeTransition(true)
    }
}

extension CardTransitionManager: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition = .present
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition = .dismiss
        return self
    }
}
