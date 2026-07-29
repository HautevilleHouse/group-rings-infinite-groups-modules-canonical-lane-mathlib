import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupRing (G : Type u) [Group G] where
  carrier : Type v
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  zeroAdd : ∀ a : carrier, addition zero a = a
  addZero : ∀ a : carrier, addition a zero = a
  addComm : ∀ a b : carrier, addition a b = addition b a
  mulAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  oneMul : ∀ a : carrier, multiplication one a = a
  mulOne : ∀ a : carrier, multiplication a one = a
  leftDistrib : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  rightDistrib : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)
  addLeftNeg : ∀ a : carrier, ∃ b : carrier, addition a b = zero

structure ModuleOverGroupRing (R : Type u) [Ring R] (M : Type v) [AddCommGroup M] where
  smul : R → M → M
  smulAddDistrib : ∀ (r : R) (x y : M), smul r (x + y) = smul r x + smul r y
  addSmulDistrib : ∀ (r s : R) (x : M), smul (r + s) x = smul r x + smul s x
  mulSmul : ∀ (r s : R) (x : M), smul (r * s) x = smul r (smul s x)
  oneSmul : ∀ (x : M), smul 1 x = x

structure GroupRingModulePackage (G : Type u) [Group G] where
  groupRing : GroupRing G
  module : ModuleOverGroupRing (groupRing.carrier) (Type v)
  moduleOverRing : module.smul = λ r m => m

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse
