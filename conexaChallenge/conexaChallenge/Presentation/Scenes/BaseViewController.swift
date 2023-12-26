//
//  BaseViewController.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 24/12/2023.
//

import UIKit

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    var loader: UIAlertController?
    
    func showLoader() {
        let alert = UIAlertController(title: nil, message: "Cargando...", preferredStyle: .alert)
        
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 15, width: 50, height: 30))
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.startAnimating()
        
        alert.view.addSubview(activityIndicator)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        loader = alert
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.loader?.dismiss(animated: true, completion: nil)
        }
    }
    
}

protocol BaseViewControllerProtocol {
    var loader: UIAlertController? { get set }
    func showLoader()
    func hideLoader()
}

