import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)

        let homeViewController = HomeViewController()
        let homeViewModel = HomeViewModel()
        homeViewModel.viewController = homeViewController
        homeViewController.viewModel = homeViewModel
        let controller = CustomNavigationController(rootViewController: homeViewController)

        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

