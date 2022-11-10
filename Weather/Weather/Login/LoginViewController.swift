// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// User authentication
final class LoginViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let loginText = "1"
        static let passwordText = "1"
        static let errorText = "Error"
        static let wrongPasswordText = "Wrong Password"
        static let okText = "Ok"
    }

    // MARK: - Private Visual Components

    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var backgroundScrollView: UIScrollView!

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // FIXME: - autologin
        performSegue(withIdentifier: "myCitiesSegueID", sender: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserver()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        if !checkResult {
            showLoginErrorAlertController()
        }
        return checkResult
    }

    // MARK: - Objc Private Methods

    @objc private func keyboardWasShownAction(notification: Notification) {
        let info = notification.userInfo as? NSDictionary
        let keyboardSize = (info?.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize?.height ?? 0, right: 0.0)
        backgroundScrollView?.contentInset = contentInsets
        backgroundScrollView?.scrollIndicatorInsets = contentInsets
    }

    @objc private func keyboardWillBeHiddenAction(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        backgroundScrollView?.contentInset = contentInsets
    }

    @objc private func hideKeyboardAction() {
        backgroundScrollView?.endEditing(true)
    }

    // MARK: - IBAction

    @IBAction private func loginButton(_ sender: Any) {}

    // MARK: - Private Methods

    private func setupUI() {
        let hideKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardAction))
        backgroundScrollView.addGestureRecognizer(hideKeyboardGestureRecognizer)
    }

    private func addObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShownAction),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHiddenAction(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func removeObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func checkUserData() -> Bool {
        let login = loginTextField.text
        let password = passwordTextField.text
        if login == Constants.loginText, password == Constants.passwordText {
            return true
        } else {
            return false
        }
    }

    func showLoginErrorAlertController() {
        let alertWrongPassword = UIAlertController(
            title: Constants.errorText,
            message: Constants.wrongPasswordText,
            preferredStyle: .alert
        )
        let okButton = UIAlertAction(title: Constants.okText, style: .default, handler: nil)
        alertWrongPassword.addAction(okButton)
        present(alertWrongPassword, animated: true, completion: nil)
    }
}
