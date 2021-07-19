//
//  LoaderViewController.swift
//  loader
//
//  Created by MacBook on 19/07/21.
//

import UIKit
import Lottie

protocol ModalViewControllerDelegate: AnyObject {
    func removeBlurredBackgroundView()
}

class LoaderViewController: UIViewController {
    
    weak var delegate: ModalViewControllerDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
