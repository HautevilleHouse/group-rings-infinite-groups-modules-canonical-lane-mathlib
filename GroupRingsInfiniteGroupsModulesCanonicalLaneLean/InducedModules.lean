import GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingBaseObjects

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure InducedModule (G : Type u) [Group G] (H : Subgroup G) (R : Type v) [CommRing R]
  (RG : GroupRing G R) (RH : GroupRing H R) (M : Type w) [AddCommGroup M]
  [ModuleOverGroupRing H R RH M] where
  carrier : Type (max w u)
  smul : RG.carrier → carrier → carrier
  smul_add : ∀ (r : RG.carrier) (x y : carrier), smul r (x + y) = smul r x + smul r y
  add_smul : ∀ (r s : RG.carrier) (x : carrier), smul (RG.addition r s) x = smul r x + smul s x
  mul_smul : ∀ (r s : RG.carrier) (x : carrier), smul (RG.multiplication r s) x = smul r (smul s x)
  one_smul : ∀ (x : carrier), smul RG.one x = x
  smul_zero : ∀ (r : RG.carrier), smul r 0 = 0
  zero_smul : ∀ (x : carrier), smul RG.zero x = 0
  inductionProperty : ∀ x : carrier, ∃ (g : G) (m : M), x = smul (RG.representation (λ g' => if g' = g then 1 else 0) ) m

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse