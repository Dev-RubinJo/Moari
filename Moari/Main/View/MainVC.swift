//
//  MainVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        let categoryRootVC = RootViewController(mainViewController: CategoryVC.makeCategoryVC, topNavigationLeftImage: UIImage(named: "drawerMenuDark"))
        let categoryDrawerVC = DrawerVC()
        let categoryVC = DrawerController(rootViewController: categoryRootVC, menuController: categoryDrawerVC)
        categoryVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        
        let curationRootVC = RootViewController(mainViewController: CurationVC.makeCurationVC, topNavigationLeftImage: UIImage(named: "drawerMenuDark"))
        let curationDrawerVC = DrawerVC()
        let curationVC = DrawerController(rootViewController: curationRootVC, menuController: curationDrawerVC)
        curationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let tabbarList = [categoryVC, curationVC]
        self.viewControllers = tabbarList
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.barStyle = .black
//    }
//    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
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

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
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
