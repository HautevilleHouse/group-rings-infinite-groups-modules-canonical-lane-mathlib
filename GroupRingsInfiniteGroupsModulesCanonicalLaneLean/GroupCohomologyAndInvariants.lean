import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingAndModuleFoundation
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.InfiniteGroupCohomology

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupCohomologyInvariantsPackage (G : Type u) [Group G] (R : Type v) [Ring R] where
  cohomology : InfiniteGroupCohomologyPackage G R
  invariants : ModuleOverGroupRing (cohomology.groupRing.carrier) (Type w)
  invarianceCondition : Prop
  cohomologyInvariantMap : (Nat → (G → R)) → (Nat → (invariants.smul.carrier))
  invarianceConditionClosed : invarianceCondition

structure GroupCohomologyInvariantsEvidence {G : Type u} [Group G] {R : Type v} [Ring R] {W : Type w} 
  (P : GroupCohomologyInvariantsPackage G R) where
  invarianceConditionFulfilled : P.invarianceCondition

def GroupCohomologyInvariantsClosed {G : Type u} [Group G] {R : Type v} [Ring R] 
  (P : GroupCohomologyInvariantsPackage G R) : Prop :=
  P.invarianceCondition ∧ InfiniteGroupCohomologyClosed P.cohomology

theorem group_cohomology_invariants_closed_from_evidence {G : Type u} [Group G] {R : Type v} [Ring R] 
  (P : GroupCohomologyInvariantsPackage G R) (E : GroupCohomologyInvariantsEvidence P) 
  (H : InfiniteGroupCohomologyEvidence P.cohomology) : GroupCohomologyInvariantsClosed P :=
by
  refine And.intro E.invarianceConditionFulfilled 
    (infinite_group_cohomology_closed_from_evidence P.cohomology H)

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse
