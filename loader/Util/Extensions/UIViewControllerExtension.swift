//
//  UIViewController.swift
//  loader
//
//  Created by MacBook on 18/07/21.
//

import UIKit

extension UIViewController {
    
    /// Crear y mostrar loader
    /// - Returns: Retorna un loader
    public func showLoader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Espera ...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        return alert
    }
    
    /// Crear y mostrar loader con una imagen
    /// - Returns: Retorna un loader
    public func showLoaderWithImage() -> UIAlertController {
        let alert = UIAlertController(title: "Cargando", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        
        imageView.image = UIImage(named: "loader")
        
        alert.view.addSubview(imageView)
        present(alert, animated: true, completion: nil)
        return alert
    }
    
    /// Crear y mostrar loader con una imagen
    /// - Returns: Retorna un loader
    public func showLoaderWithImageTwo() -> Void {
        let loadingIndicatorView = UIView()
        
        loadingIndicatorView.frame = view.frame
        loadingIndicatorView.backgroundColor = .gray
        loadingIndicatorView.isHidden = true
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        imageView.image = UIImage(named: "loader.png")
        
        loadingIndicatorView.addSubview(imageView)
        view.addSubview(loadingIndicatorView)
    }
    
    /// Cerrar loader
    ///
    /// - Parameter loader: loader a cerrar
    public func closeLoader(loader: UIAlertController) -> Void {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
}
