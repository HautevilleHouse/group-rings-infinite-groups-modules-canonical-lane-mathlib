import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingAndModuleFoundation

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure CrossedProductStructure {G : Type u} [Group G] (R : Type v) [Ring R] where
  groupRing : GroupRing G
  groupRingModule : ModuleOverGroupRing (groupRing.carrier) R
  cocycleCondition : Prop
  twistedMultiplication : Prop
  cocycleConditionClosed : cocycleCondition
  twistedMultiplicationClosed : twistedMultiplication

structure CrossedProductEvidence {G : Type u} [Group G] {R : Type v} [Ring R] (C : CrossedProductStructure G R) where
  cocycleConditionFulfilled : C.cocycleCondition
  twistedMultiplicationFulfilled : C.twistedMultiplication

def CrossedProductClosed {G : Type u} [Group G] {R : Type v} [Ring R] (C : CrossedProductStructure G R) : Prop :=
  C.cocycleCondition ∧ C.twistedMultiplication

theorem crossed_product_closed_from_evidence {G : Type u} [Group G] {R : Type v} [Ring R] 
  (C : CrossedProductStructure G R) (E : CrossedProductEvidence C) : CrossedProductClosed C :=
by
  exact And.intro E.cocycleConditionFulfilled E.twistedMultiplicationFulfilled

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse
