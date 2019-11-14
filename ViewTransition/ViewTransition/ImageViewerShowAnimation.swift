//
//  ImageViewerShowAnimation.swift
//  ViewTransition
//
//  Created by Fábio Salata on 14/11/19.
//  Copyright © 2019 Fábio Salata. All rights reserved.
//

import UIKit

class ImageViewerShowAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) as? ImageViewerViewController,
              let fromViewController = transitionContext.viewController(forKey: .from) as? ViewController
             else {
                return
        }
        
        let startFrame = fromViewController.imageViewButton.frame
        toViewController.view.frame = startFrame
        toViewController.view.layer.cornerRadius = startFrame.height / 2
        toViewController.view.clipsToBounds = true

        transitionContext.containerView.addSubview(toViewController.view)

        let animationTiming = UICubicTimingParameters(animationCurve: .easeInOut)

        let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), timingParameters: animationTiming)

        animator.addAnimations {
            toViewController.view.frame = transitionContext.finalFrame(for: toViewController)
            toViewController.view.layer.cornerRadius = 0
        }

        animator.addCompletion { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

        animator.startAnimation()
    }
    

}
