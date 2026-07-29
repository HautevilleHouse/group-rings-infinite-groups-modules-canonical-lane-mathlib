import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingAndModuleFoundation

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure InfiniteGroupCohomologyPackage (G : Type u) [Group G] (R : Type v) [Ring R] where
  groupRing : GroupRing G
  module : ModuleOverGroupRing (groupRing.carrier) R
  coboundaryOperator : (Nat → (G → R)) → (Nat → (G → R))
  cohomologyGroup : Nat → Type w
  cocycleCondition : Prop
  exactnessCondition : Prop
  coboundaryOperatorClosed : coboundaryOperator = λ f n => λ g => f (n+1) g
  cocycleConditionClosed : cocycleCondition
  exactnessConditionClosed : exactnessCondition

structure InfiniteGroupCohomologyEvidence {G : Type u} [Group G] {R : Type v} [Ring R] 
  (P : InfiniteGroupCohomologyPackage G R) where
  cocycleConditionFulfilled : P.cocycleCondition
  exactnessConditionFulfilled : P.exactnessCondition

def InfiniteGroupCohomologyClosed {G : Type u} [Group G] {R : Type v} [Ring R] 
  (P : InfiniteGroupCohomologyPackage G R) : Prop :=
  P.cocycleCondition ∧ P.exactnessCondition ∧ (P.coboundaryOperator = λ f n => λ g => f (n+1) g)

theorem infinite_group_cohomology_closed_from_evidence {G : Type u} [Group G] {R : Type v} [Ring R] 
  (P : InfiniteGroupCohomologyPackage G R) (E : InfiniteGroupCohomologyEvidence P) : 
  InfiniteGroupCohomologyClosed P :=
by
  refine And.intro E.cocycleConditionFulfilled (And.intro E.exactnessConditionFulfilled ?_)
  exact P.coboundaryOperatorClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse
