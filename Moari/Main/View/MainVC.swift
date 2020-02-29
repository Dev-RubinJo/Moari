//
//  MainVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import SideMenu

class MainVC: UITabBarController, MainVCDelegate {
    
    static let shared: MainVCDelegate = MainVC()
    let menuVC = SideMenuNavigationController(rootViewController: DrawerVC())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        SideMenuManager.default.leftMenuNavigationController = menuVC
        
        let presentationStyle = SideMenuPresentationStyle.menuSlideIn
        presentationStyle.menuStartAlpha = CGFloat(1.0)
        presentationStyle.menuScaleFactor = CGFloat(1.0)
        presentationStyle.onTopShadowOpacity = 0
        presentationStyle.presentingEndAlpha = CGFloat(1.0)
        presentationStyle.presentingScaleFactor = CGFloat(1.0)

        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.menuWidth = min(view.frame.width, view.frame.height) * 0.64
        settings.statusBarEndAlpha = 0
        menuVC.settings = settings
        
        let categoryVC = UINavigationController(rootViewController: CategoryVC.makeCategoryVC)
        let curationVC = UINavigationController(rootViewController: CurationVC.makeCurationVC)
        
        let tabbarList = [categoryVC, curationVC]
        self.viewControllers = tabbarList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
        self.setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.navigationBar.isHidden = true
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    static var makeMainVC: MainVC {
        get {
            let vc = MainVC()
            return vc
        }
    }
    
    func setMainVCNavigationBar() {
        
    }
    
    func didTapDrawerMenuButton() {
        self.navigationController?.pushViewController(self.menuVC, animated: true)
    }
    
    func didTapAddReviewButton() {
        
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
