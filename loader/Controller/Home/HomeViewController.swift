//
//  HomeViewController.swift
//  loader
//
//  Created by MacBook on 18/07/21.
//

import UIKit
import Lottie

class HomeViewController: UIViewController, ModalViewControllerDelegate {
    // MARK: - Outlets
    @IBOutlet weak var showLoaderButton: UIButton!
    @IBOutlet weak var showLoaderWithImageButton: UIButton!
    @IBOutlet weak var showViewModalButton: UIButton!
    @IBOutlet weak var showLottieButton: UIButton!
    
    let animationView = AnimationView()
    
    // MARK: - Button Actions
    @IBAction func showLoaderAction(_ sender: Any) {
        let loader = self.showLoader()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.closeLoader(loader: loader)
        }
    }
    @IBAction func showLoaderWithImageButton(_ sender: Any) {
        let loader = self.showLoaderWithImage()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.closeLoader(loader: loader)
        }
    }
    @IBAction func showViewModalAction(_ sender: Any) {
        self.definesPresentationContext = true
        self.providesPresentationContextTransitionStyle = true
        
        _overlayBlurredBackgroundView()
    }
    @IBAction func showLottieButton(_ sender: Any) {
        _setupAnimation()
    }
    
    // MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "ShowModalView" {
                if let viewController = segue.destination as? LoaderViewController {
                    viewController.delegate = self
                    viewController.modalPresentationStyle = .overFullScreen
                }
            }
        }
    }
    
    // MARK: - Private Methods
    private func _overlayBlurredBackgroundView() {
        
        let blurredBackgroundView = UIVisualEffectView()
        
        blurredBackgroundView.frame = view.frame
        blurredBackgroundView.effect = UIBlurEffect(style: .dark)
        
        view.addSubview(blurredBackgroundView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.removeBlurredBackgroundView()
        }
    }
    private func _setupAnimation() {
        animationView.animation = Animation.named("loader")
        animationView.frame = view.bounds
        animationView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.animationView.removeFromSuperview()
        }
    }
    
    // MARK: - Public Methods
    public func removeBlurredBackgroundView() {
        for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }
}
