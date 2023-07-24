//
//  Extensions.swift
//  PopupSDK
//
//  Created by Ayush Bhatt on 24/07/23.
//

import UIKit

extension UIViewController{
    
    
/**
     Presents a custom pop-up view controller with the specified alignment.

     - Parameter alignment: An instance of `PopUpAlignment` enum that determines the vertical alignment of the pop-up view within the container.

     The `PopUpAlignment` enum represents different alignments for the pop-up element within a container. It provides three possible alignment options: `top`, `center`, and `bottom`. The `top` and `bottom` cases allow for vertical alignment, while the `center` case allows for vertical centering without any offset. The `top` and `bottom` cases also provide an additional parameter to customize the vertical offset.

     Usage:
     ```swift
     // Example usage to show a pop-up aligned to the bottom with an offset of -20.0
     showPopUp(alignment: .bottom(-20.0))
**/
    public func showPopUp(alignment: PopUpAlignment){
        let vc = PopUpViewController(popUpAlignment: alignment)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}
