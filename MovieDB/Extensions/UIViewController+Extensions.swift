//
//  UIViewController+Extensions.swift
//  MovieDB
//
//  Created by Yris Siqueira on 26/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Show Error Message
    
    func showErrorAlert(error: Error) {
        let alert = UIAlertController(title: "Erro", message: "Ocorreu um erro, contatar o administrador. Erro: \(error.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
