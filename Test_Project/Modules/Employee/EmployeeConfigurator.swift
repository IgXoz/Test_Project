import Foundation

class EmployeeConfigurator: EmployeeConfiguratorProtocol {
    
    //Configures module
    func configure(with viewController: EmployeeViewController) {
        let presenter = EmployeePresenter(view: viewController)
        let interactor = EmployeeInteractor(presenter: presenter)
        let router = EmployeeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }

}
