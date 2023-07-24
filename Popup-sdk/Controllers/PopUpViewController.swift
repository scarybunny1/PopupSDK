//
//  PopUpViewController.swift
//  PopupSDK
//
//  Created by Ayush Bhatt on 24/07/23.
//

import UIKit

/**
 `PopUpViewController` is a custom view controller class that presents a pop-up view with customizable alignment.

 This view controller is designed to present a pop-up view over the current view controller with various alignment options, including top, center, and bottom.

 - Use `init(popUpAlignment:)` initializer to create an instance of `PopUpViewController` with the desired alignment.

 Usage:
 ```swift
 // Create an instance of PopUpViewController with center alignment
 let popUpVC = PopUpViewController(popUpAlignment: .center)
 // Present the pop-up view controller modally
 present(popUpVC, animated: false, completion: nil)
 **/
public class PopUpViewController: UIViewController {
    
    //MARK:  Class Properties
    private let popUpAlignment: PopUpAlignment
    
    //MARK:  Class initialisers
    public init(popUpAlignment: PopUpAlignment) {
        self.popUpAlignment = popUpAlignment
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK:  Class UI components
    let popupView = PopUpView()
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    //MARK:  Lifecycle methods
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(blurView)
        view.addSubview(popupView)
        popupView.delegate = self
        popupView.configure(title: "Pop-up title", message: "This is the pop-up message...")
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        blurView.frame = view.bounds
        positionPopupView()
    }
    
    //MARK:  Class Helper methods
    private func positionPopupView(){
        popupView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        switch popUpAlignment {
        case .top(let offset):
            popupView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset).isActive = true
        case .center:
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        case .bottom(let offset):
            popupView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -offset).isActive = true
            popupView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor).isActive = true
        }
    }
}

extension PopUpViewController: PopUpViewDelegate{
    func didTapOkButton() {
        dismiss(animated: false)
    }
}
