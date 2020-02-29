//
//  RootViewController.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/28.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

protocol RootViewControllerDelegate: class {
    
    func rootViewControllerDidTapMenuButton(_ rootViewController: RootViewController)
}

class RootViewController: UINavigationController, UINavigationControllerDelegate {
    
    fileprivate var menuButton: UIBarButtonItem!
    
    fileprivate var topNavigationLeftImage: UIImage?
    
    weak var drawerDelegate: RootViewControllerDelegate?
    
    public init(mainViewController: UIViewController, topNavigationLeftImage: UIImage?) {
        super.init(rootViewController: mainViewController)
        self.topNavigationLeftImage = topNavigationLeftImage
        self.menuButton = UIBarButtonItem(image: topNavigationLeftImage, style: .plain, target: self, action: #selector(self.handleMenuButton))
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        self.prepareNavigationBar()
    }
}

extension RootViewController {
    
    fileprivate func prepareNavigationBar() {
        self.topViewController?.navigationItem.title = self.topViewController?.title
        if self.viewControllers.count <= 1 {
            topViewController?.navigationItem.leftBarButtonItem = self.menuButton
        }
    }
}

extension RootViewController {
    
    @objc fileprivate func handleMenuButton() {
        self.drawerDelegate?.rootViewControllerDidTapMenuButton(self)
    }
}
