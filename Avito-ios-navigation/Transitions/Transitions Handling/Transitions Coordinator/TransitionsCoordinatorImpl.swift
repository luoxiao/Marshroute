import UIKit

public final class TransitionsCoordinatorImpl:
    TransitionContextsStackClientProviderHolder,
    TransitionsCoordinatorDelegateHolder,
    TransitionsCoordinator,
    TopViewControllerFinder,
    TransitionsTracker,
    TransitionsMarker,
    TransitionsMarkersHolder
{
    // MARK: - TransitionContextsStackClientProviderHolder
    public let stackClientProvider: TransitionContextsStackClientProvider
    
    // MARK: - TransitionsCoordinatorDelegateHolder
    public weak var transitionsCoordinatorDelegate: TransitionsCoordinatorDelegate?
    
    // MARK: - TransitionsMarkersHolder
    public var markers = [TransitionId : TransitionUserId]()
    
    // MARK: - Init
    public init(stackClientProvider: TransitionContextsStackClientProvider = TransitionContextsStackClientProviderImpl())
    {
        self.stackClientProvider = stackClientProvider
    }
    
    // MARK: - TopViewControllerFinder
    public func findTopViewController(animatingTransitionsHandler transitionsHandler: AnimatingTransitionsHandler)
        -> UIViewController?
    {
        return findTopViewControllerImpl(
            forTransitionsHandlerBox: .init(
                animatingTransitionsHandler: transitionsHandler
            )
        )
    }

    public func findTopViewController(containingTransitionsHandler transitionsHandler: ContainingTransitionsHandler)
        -> UIViewController?
    {
        return findTopViewControllerImpl(
            forTransitionsHandlerBox: .init(
                containingTransitionsHandler: transitionsHandler
            )
        )
    }
    
    // MARK: - TransitionsTracker
    public func countOfTransitionsAfterTrackedTransition(
        trackedTransition: TrackedTransition,
        untilLastTransitionOfTransitionsHandler targetTransitionsHandler: TransitionsHandler)
        -> Int?
    {
        return countOfTransitionsAfterTrackedTransitionImpl(
            trackedTransition,
            untilLastTransitionOfTransitionsHandler: targetTransitionsHandler
        )
    }
    
    public func restoredTransitionFromTrackedTransition(
        trackedTransition: TrackedTransition,
        searchingFromTransitionsHandler transitionsHandler: AnimatingTransitionsHandler)
        -> RestoredTransitionContext?
    {
        return restoredTransitionFromTrackedTransition(
            trackedTransition,
            searchingFromTransitionsHandlerBox: .init(animatingTransitionsHandler: transitionsHandler)
        )
    }
    
    public func restoredTransitionFromTrackedTransition(
        trackedTransition: TrackedTransition,
        searchingFromTransitionsHandler transitionsHandler: ContainingTransitionsHandler)
        -> RestoredTransitionContext?
    {
        return restoredTransitionFromTrackedTransition(
            trackedTransition,
            searchingFromTransitionsHandlerBox: .init(containingTransitionsHandler: transitionsHandler)
        )
    }
    
    // MARK: - TransitionsMarker
    public func markTransitionId(transitionId: TransitionId, withUserId userId: TransitionUserId) {
        markTransitionIdImpl(transitionId: transitionId, withUserId: userId)
    }
}