//
//  Extensions.swift
//  Viper Demo Login
//
//  Created by Neosoft on 29/09/23.
//

import UIKit

extension UIViewController{
    //MARK: - Alert
    func showSingleButtonAlert(title: String,msg :String, okClosure: (()->Void)?){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
            okClosure?()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Navigation Bar
    func setNavBarStyle(fontName:String,fontSize:Int){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor.red
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: fontName, size: CGFloat(fontSize))!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let backButton = UIBarButtonItem()
        backButton.title = "" // Set an empty title
        navigationItem.backBarButtonItem = backButton
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "chevron.left")
    }
}


extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                                    CGRect(x: 15, y: 0, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                                                CGRect(x: 10, y: 0, width: 50, height: 30))
        iconContainerView.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: iconContainerView.leadingAnchor),
            iconView.trailingAnchor.constraint(equalTo: iconContainerView.trailingAnchor,constant: -30),
            iconView.topAnchor.constraint(equalTo: iconContainerView.topAnchor),
            iconView.bottomAnchor.constraint(equalTo: iconContainerView.bottomAnchor)
        ])
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func setPlaceholder(_ placeholder: String){
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}
