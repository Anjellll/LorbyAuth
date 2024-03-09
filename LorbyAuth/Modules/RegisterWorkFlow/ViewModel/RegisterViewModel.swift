//
//  RegisterViewModel.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class RegisterViewModel {
    var passwordValidationResult: ((Bool, Bool, Bool, Bool, Bool) -> Void)?
    
    func validatePassword(_ password: String?, repeatedPassword: String?) {
        guard let password = password, let repeatedPassword = repeatedPassword else {
            notifyValidationResult(false, false, false, false, false)
            return
        }

        let isLengthValid = (8...15).contains(password.count)
        let isAlphanumeric = password.range(of: "(?=.*[a-z])(?=.*[A-Z]).{1,}", options: .regularExpression) != nil
        let containsDigit = password.range(of: "^(?=.*[0-9])", options: .regularExpression) != nil
        let containsSpecialCharacter = password.range(of: "(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{1,}", options: .regularExpression) != nil
        let passwordsMatch = password == repeatedPassword

        notifyValidationResult(isLengthValid, isAlphanumeric, containsDigit, containsSpecialCharacter, passwordsMatch)
    }

    private func notifyValidationResult(_ isLengthValid: Bool, _ isAlphanumeric: Bool, _ containsDigit: Bool, _ containsSpecialCharacter: Bool, _ passwordsMatch: Bool) {
    
        passwordValidationResult?(isLengthValid, isAlphanumeric, containsDigit, containsSpecialCharacter, passwordsMatch)
    }
}
