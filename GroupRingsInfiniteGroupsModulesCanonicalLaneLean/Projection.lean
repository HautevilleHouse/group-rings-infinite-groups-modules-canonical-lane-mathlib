import GroupRingsInfiniteGroupsModulesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure Projection (X : Type) where
  toFun : X → X
  idempotent : ∀ x : X, toFun (toFun x) = toFun x

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse