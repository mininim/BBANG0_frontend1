//
//  NavigationViewController.swift
//  Bbang0_Final
//
//  Created by 김사랑 on 2022/11/10.
//

import UIKit

class NavigationViewController: UINavigationController {

    override var childForStatusBarStyle: UIViewController? {
        return topViewController
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

}
