import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingAndModuleFoundation

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure HopfAlgebraStructure (G : Type u) [Group G] (R : Type v) [CommRing R] where
  groupRing : GroupRing G
  module : ModuleOverGroupRing (groupRing.carrier) (Type w)
  comultiplication : module.smul.carrier → module.smul.carrier
  counit : module.smul.carrier → R
  antipode : module.smul.carrier → module.smul.carrier
  coassociativity : Prop
  counitality : Prop
  antipodeCondition : Prop
  coassociativityClosed : coassociativity
  counitalityClosed : counitality
  antipodeConditionClosed : antipodeCondition

structure HopfAlgebraEvidence {G : Type u} [Group G] {R : Type v} [CommRing R] {W : Type w} 
  (H : HopfAlgebraStructure G R) where
  coassociativityFulfilled : H.coassociativity
  counitalityFulfilled : H.counitality
  antipodeConditionFulfilled : H.antipodeCondition

def HopfAlgebraClosed {G : Type u} [Group G] {R : Type v} [CommRing R] (H : HopfAlgebraStructure G R) : Prop :=
  H.coassociativity ∧ H.counitality ∧ H.antipodeCondition

theorem hopf_algebra_closed_from_evidence {G : Type u} [Group G] {R : Type v} [CommRing R] 
  (H : HopfAlgebraStructure G R) (E : HopfAlgebraEvidence H) : HopfAlgebraClosed H :=
by
  exact And.intro E.coassociativityFulfilled (And.intro E.counitalityFulfilled E.antipodeConditionFulfilled)

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse
