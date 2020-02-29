//
//  DrawerController.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/28.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class DrawerController: BaseVC, RootViewControllerDelegate {
    
    var rootViewController: RootViewController
    var menuController: MenuViewController
    var isMenuExpanded: Bool = false
    let overlayView = UIView()
    
    init(rootViewController: RootViewController, menuController: MenuViewController) {
        self.rootViewController = rootViewController
        self.menuController = menuController
        super.init(nibName: nil, bundle: nil)
        self.rootViewController.drawerDelegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChild(self.rootViewController)
        self.view.addSubview(self.rootViewController.view)
        self.rootViewController.didMove(toParent: self)
        
        self.overlayView.backgroundColor = .black
        self.overlayView.alpha = 0
        self.view.addSubview(self.overlayView)
        
        self.menuController.view.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height)
        self.addChild(self.menuController)
//        self.view.addSubview(self.menuController.view)
        self.menuController.didMove(toParent: self)
        
        self.configureGestures()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.overlayView.frame = self.view.bounds
        let width: CGFloat = (self.isMenuExpanded) ? self.view.bounds.width * 2 / 3 : 0.0
        self.menuController.view.frame = CGRect(x: 0, y: 0, width: width , height: self.view.bounds.height)
    }
    
    func toggleMenu() {
        self.isMenuExpanded = !self.isMenuExpanded
        let bounds = self.view.bounds
        let width: CGFloat = (self.isMenuExpanded) ? bounds.width * 2 / 3 : 0.0
        if self.isMenuExpanded {
            self.view.addSubview(self.menuController.view)
            self.menuController.view.isHidden = false
        } else {
            
        }
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.menuController.view.frame = CGRect(x: 0, y: 0, width: width, height: bounds.height)
            self.overlayView.alpha = (self.isMenuExpanded) ? 0.5 : 0.0
        }) { (success) in
        }
    }
    
    func navigateTo(viewController: UIViewController) {
        self.rootViewController.setViewControllers([viewController], animated: true)
        self.toggleMenu()
    }
    
    fileprivate func configureGestures() {
        // TODO: Pan Gesture로 바꾼다면?
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeLeftGesture.direction = .left
        self.overlayView.addGestureRecognizer(swipeLeftGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOverlay))
        self.overlayView.addGestureRecognizer(tapGesture)
    }
    
    @objc fileprivate func didSwipeLeft() {
        self.toggleMenu()
    }
    
    @objc fileprivate func didTapOverlay() {
        self.toggleMenu()
    }
}

extension DrawerController {
    
    func rootViewControllerDidTapMenuButton(_ rootViewController: RootViewController) {
        self.toggleMenu()
    }
}
