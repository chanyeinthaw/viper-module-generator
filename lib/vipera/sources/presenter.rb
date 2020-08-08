module Sources
    def self.presenter(name)
        return "#{name}Presenter.swift", <<~PRESENTER
        import UIKit
        
        class #{name}Presenter: #{name}PresenterProtocol {
            var view: #{name}ViewProtocol?
            var interactor: #{name}InteractorInputProtocol?
            var router: #{name}RouterProtocol?
        }

        //  MARK: INTERACTOR -> PRESENTER
        extension #{name}Presenter: #{name}InteractorOutputProtocol {
            
        }
        PRESENTER
    end
end