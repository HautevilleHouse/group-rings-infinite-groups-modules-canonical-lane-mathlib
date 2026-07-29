import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.AugmentationIdeal

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure ZeroDivisorConjecture (G : Type u) [Group G] (R : Type v) [CommRing R] where
  groupRing : AugmentationIdeal G R
  torsionFree : Prop
  noZeroDivisors : Prop
  torsionFreeTerm : torsionFree
  noZeroDivisorsTerm : noZeroDivisors

structure ZeroDivisorConjectureEvidence (Z : ZeroDivisorConjecture G R) where
  torsionFreeClosed : Z.torsionFree
  noZeroDivisorsClosed : Z.noZeroDivisors

def ZeroDivisorConjectureClosed (Z : ZeroDivisorConjecture G R) : Prop :=
  Z.torsionFree ∧ Z.noZeroDivisors

theorem zero_divisor_conjecture_closed_from_evidence (Z : ZeroDivisorConjecture G R) (E : ZeroDivisorConjectureEvidence Z) :
    ZeroDivisorConjectureClosed Z := by
  exact And.intro E.torsionFreeClosed E.noZeroDivisorsClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse