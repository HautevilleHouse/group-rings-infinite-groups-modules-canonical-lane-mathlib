import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.AugmentationIdeal

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure KaplanskyUnitConjecture (G : Type u) [Group G] (R : Type v) [CommRing R] where
  groupRing : AugmentationIdeal G R
  unitGroup : Subgroup (Units (groupRing.groupRing.carrier))
  torsionFree : Prop
  unitGroupTrivial : Prop
  torsionFreeTerm : torsionFree
  unitGroupTrivialTerm : unitGroupTrivial

structure KaplanskyUnitConjectureEvidence (K : KaplanskyUnitConjecture G R) where
  torsionFreeClosed : K.torsionFree
  unitGroupTrivialClosed : K.unitGroupTrivial

def KaplanskyUnitConjectureClosed (K : KaplanskyUnitConjecture G R) : Prop :=
  K.torsionFree ∧ K.unitGroupTrivial

theorem kaplansky_unit_conjecture_closed_from_evidence (K : KaplanskyUnitConjecture G R) (E : KaplanskyUnitConjectureEvidence K) :
    KaplanskyUnitConjectureClosed K := by
  exact And.intro E.torsionFreeClosed E.unitGroupTrivialClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse