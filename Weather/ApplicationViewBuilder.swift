import SwiftUI

@MainActor
final class ApplicationViewBuilder: Assembly, ObservableObject {
    
    required init(container: Container) {
        super.init(container: container)
    }
   
    @ViewBuilder
    func build(view: Views) -> some View {
        switch view {
        case .main:
            buildMain()
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    fileprivate func buildMain() -> some View {
        container.resolve(MainAssembly.self).build()
    }
}

extension ApplicationViewBuilder {
    static var stub: ApplicationViewBuilder {
        // Create a stub container that conforms to the Container protocol
        let factory = AssemblyFactory()
        let stubContainer = DependencyContainer(assemblyFactory: factory)
        
        // Apply necessary assemblies for the stub
        stubContainer.apply(NavigationAssembly.self)
        stubContainer.apply(MainAssembly.self)
        
        return ApplicationViewBuilder(container: stubContainer)
    }
}
