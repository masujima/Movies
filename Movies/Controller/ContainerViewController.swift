//
//  ContainerViewController.swift
//  Movies
//
//  Created by Yernar Masujima on 8/10/22.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var mainNavigationController: UINavigationController!
    var mainViewController: MainViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewController = MainViewController(service: MoviesService())
        mainNavigationController = UINavigationController(rootViewController: mainViewController)
        view.addSubview(mainNavigationController.view)
        addChild(mainNavigationController)
        mainNavigationController.didMove(toParent: self)
    }
}
