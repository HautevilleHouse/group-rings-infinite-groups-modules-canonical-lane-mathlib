import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingModule

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure KTheoryData (G : Type u) [Group G] where
  module : GroupRingModule G
  k0Group : Type
  k0FinitelyGenerated : Prop
  bassConjectureHolds : Prop

structure KTheoryEvidence (K : KTheoryData G) where
  k0FinitelyGeneratedClosed : K.k0FinitelyGenerated
  bassConjectureHoldsClosed : K.bassConjectureHolds

def KTheoryClosed (K : KTheoryData G) : Prop :=
  K.k0FinitelyGenerated ∧ K.bassConjectureHolds

theorem k_theory_closed_from_evidence (K : KTheoryData G) (E : KTheoryEvidence K) :
    KTheoryClosed K := by
  exact And.intro E.k0FinitelyGeneratedClosed E.bassConjectureHoldsClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse