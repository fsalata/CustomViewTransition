//
//  ViewController.swift
//  ViewTransition
//
//  Created by Fábio Salata on 14/11/19.
//  Copyright © 2019 Fábio Salata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageViewButton: UIImageView!
    
    var navigationDelegate: NavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewButton.layer.cornerRadius = imageViewButton.frame.height / 2
        imageViewButton.clipsToBounds = true
        imageViewButton.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openViewer(gesture:)))
        imageViewButton.addGestureRecognizer(tapGesture)
        
        if let navigationController = self.navigationController {
            navigationDelegate = NavigationDelegate(withNavigationController: navigationController)
            navigationController.delegate = navigationDelegate
        }
    }
    
    @objc func openViewer(gesture: UITapGestureRecognizer) {
        if let imageViewer = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as? ImageViewerViewController {
            imageViewer.image = UIImage(named: "scarlett")!
            navigationController?.pushViewController(imageViewer, animated: true)
        }
    }


}

