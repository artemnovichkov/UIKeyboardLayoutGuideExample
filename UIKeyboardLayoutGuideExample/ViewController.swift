//
//  Created by Artem Novichkov on 8.06.2021.
//

import UIKit

class ViewController: UIViewController {

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Login"
        return textField
    }()
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue
        button.setTitle("Login", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -8),
            loginTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])

        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])

        view.addSubview(loginButton)
        view.keyboardLayoutGuide.followsUndockedKeyboard = true
        self.addLoginButtonConstraints()
    }

    private func addLoginButtonConstraints() {
        let buttonDockedTrailing = view.keyboardLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 1.0)
        buttonDockedTrailing.identifier = "buttonDockedTrailing"
        view.keyboardLayoutGuide.setConstraints([buttonDockedTrailing], activeWhenNearEdge: .bottom)

        let buttonCenterX = view.keyboardLayoutGuide.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor)
        buttonCenterX.identifier = "buttonCenterX"
        view.keyboardLayoutGuide.setConstraints([buttonCenterX], activeWhenAwayFrom: [.leading, .trailing, .bottom])

        let buttonUndockedTrailing = view.keyboardLayoutGuide.trailingAnchor.constraint(
            equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 1.0)
        buttonUndockedTrailing.identifier = "buttonUndockedTrailing"
        view.keyboardLayoutGuide.setConstraints([buttonUndockedTrailing], activeWhenNearEdge: .trailing)

        let buttonUndockedLeading = loginButton.leadingAnchor.constraint(
            equalToSystemSpacingAfter: view.keyboardLayoutGuide.leadingAnchor, multiplier: 1.0)
        buttonUndockedLeading.identifier = "buttonUndockedLeading"
        view.keyboardLayoutGuide.setConstraints([buttonUndockedLeading], activeWhenNearEdge: .leading)

        let buttonTop = view.keyboardLayoutGuide.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 1.0)
        buttonTop.identifier = "buttonTop"
        view.keyboardLayoutGuide.setConstraints([buttonTop], activeWhenAwayFrom: .top)

        let buttonBottom = loginButton.topAnchor.constraint(equalToSystemSpacingBelow: view.keyboardLayoutGuide.bottomAnchor, multiplier: 1.0)
        buttonBottom.identifier = "buttonBottom"
        view.keyboardLayoutGuide.setConstraints([buttonBottom], activeWhenNearEdge: .top)
    }
}
