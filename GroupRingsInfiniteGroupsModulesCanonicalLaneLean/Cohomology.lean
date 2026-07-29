import GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingBaseObjects

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupCohomology (G : Type u) [Group G] (R : Type v) [CommRing R]
  (RG : GroupRing G R) (n : ℕ) where
  cochains : Type (max u v)
  coboundary : cochains → cochains
  coboundary_sq : ∀ f : cochains, coboundary (coboundary f) = 0

structure CohomologyModule (G : Type u) [Group G] (R : Type v) [CommRing R]
  (RG : GroupRing G R) (M : Type w) [AddCommGroup M]
  [ModuleOverGroupRing G R RG M] (n : ℕ) extends GroupCohomology G R RG n where
  action : M → cochains → cochains
  action_linear : ∀ m : M, LinearMap R cochains cochains

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse