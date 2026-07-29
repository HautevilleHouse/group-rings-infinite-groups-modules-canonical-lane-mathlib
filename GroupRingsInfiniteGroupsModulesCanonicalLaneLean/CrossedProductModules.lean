import GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingBaseObjects

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure CrossedProduct (G : Type u) [Group G] (R : Type v) [CommRing R]
  (RG : GroupRing G R) (N : Subgroup G) where
  carrier : Type (max u v)
  twistedMultiplication : carrier → carrier → carrier
  cocycle : (G → G → R)
  cocycleCondition : ∀ g h k : G, 
    cocycle g h * cocycle (g * h) k = (cocycle g (h * k)) * (cocycle h k)
  cocycleNormalized : ∀ g : G, cocycle g 1 = 1 ∧ cocycle 1 g = 1

structure ModuleOverCrossedProduct (G : Type u) [Group G] (R : Type v) [CommRing R]
  (RG : GroupRing G R) (CP : CrossedProduct G R RG N) (M : Type w) [AddCommGroup M]
  extends ModuleOverGroupRing G R RG M where
  twistedAction : N → (M → M)
  twistedAction_linear : ∀ n : N, LinearMap R M M
  twistedAction_compat : ∀ n : N, twistedAction n = smul (CP.carrier)

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse