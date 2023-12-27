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
    
    func showError(errorDescription: String) {
        let alert = UIAlertController(title: title, message: errorDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

protocol BaseViewControllerProtocol {
    var loader: UIAlertController? { get set }
    func showLoader()
    func hideLoader()
    func showError(errorDescription: String)
}

