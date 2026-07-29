import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingModule

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupCohomologyData (G : Type u) [Group G] (n : ℕ) where
  module : GroupRingModule G
  cohomologyGroup : Type
  finitelyGenerated : Prop
  vanishesAboveDimension : Prop

structure GroupCohomologyEvidence (H : GroupCohomologyData G n) where
  finitelyGeneratedClosed : H.finitelyGenerated
  vanishesAboveDimensionClosed : H.vanishesAboveDimension

def GroupCohomologyClosed (H : GroupCohomologyData G n) : Prop :=
  H.finitelyGenerated ∧ H.vanishesAboveDimension

theorem group_cohomology_closed_from_evidence (H : GroupCohomologyData G n) (E : GroupCohomologyEvidence H) :
    GroupCohomologyClosed H := by
  exact And.intro E.finitelyGeneratedClosed E.vanishesAboveDimensionClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse