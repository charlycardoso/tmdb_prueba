//
//  TextFieldUtils.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 17/11/22.
//

import Foundation
import UIKit

extension UITextField {
    
    func isNotBlank() -> Bool {
        
        ((text?.isEmpty) != nil) ? text!.count > 0 : false
       
    }
    
}
