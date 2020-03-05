//
//  MainVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import KWDrawerController

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        
        let categoryRootVC = UINavigationController(rootViewController: CategoryVC.makeCategoryVC)
        categoryRootVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        
        let curationRootVC = UINavigationController(rootViewController: CurationVC.makeCurationVC)
        curationRootVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let tabbarList = [categoryRootVC, curationRootVC]
        self.viewControllers = tabbarList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDrawerConfig()
    }
    
    func setDrawerConfig() {
        self.drawerController?.setAbsolute(true, for: .left)
        self.drawerController?.getSideOption(for: .left)?.isShadow = false
        self.drawerController?.getSideOption(for: .left)?.isFadeScreen = true
        self.drawerController?.getSideOption(for: .left)?.isBlur = false
        self.drawerController?.getSideOption(for: .left)?.isOverflowAnimation = false
        self.drawerController?.getSideOption(for: .left)?.isGesture = true
        self.drawerController?.getSideOption(for: .left)?.isTapToClose = true
        self.drawerController?.setBringToFront(true, for: .left)
    }
    
    static var makeMainVC: MainVC {
        get {
            let vc = MainVC()
            return vc
        }
    }
}
// MARK: - UITabBarControllerDelegate
extension MainVC: UITabBarControllerDelegate {

    /*
     Called to allow the delegate to return a UIViewControllerAnimatedTransitioning delegate object for use during a noninteractive tab bar view controller transition.
     ref: https://developer.apple.com/documentation/uikit/uitabbarcontrollerdelegate/1621167-tabbarcontroller
     */
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabBarAnimatedTransitioning()
    }

}

/*
 UIViewControllerAnimatedTransitioning
 A set of methods for implementing the animations for a custom view controller transition.
 ref: https://developer.apple.com/documentation/uikit/uiviewcontrolleranimatedtransitioning
 */

final class TabBarAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    /*
     Tells your animator object to perform the transition animations.
     */
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }

        destination.alpha = 0.0
        destination.transform = .init(scaleX: 1, y: 1)
        transitionContext.containerView.addSubview(destination)

        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            destination.alpha = 1.0
            destination.transform = .identity
        }, completion: { transitionContext.completeTransition($0) })
    }

    /*
     Asks your animator object for the duration (in seconds) of the transition animation.
     */
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
}
