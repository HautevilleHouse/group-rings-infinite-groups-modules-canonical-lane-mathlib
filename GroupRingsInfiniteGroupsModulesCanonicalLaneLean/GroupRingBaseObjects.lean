import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupRing (G : Type u) [Group G] (R : Type v) [CommRing R] where
  carrier : Type (max u v)
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  add_assoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  zero_add : ∀ a : carrier, addition zero a = a
  add_zero : ∀ a : carrier, addition a zero = a
  add_comm : ∀ a b : carrier, addition a b = addition b a
  neg : carrier → carrier
  add_left_neg : ∀ a : carrier, addition (neg a) a = zero
  mul_assoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  one_mul : ∀ a : carrier, multiplication one a = a
  mul_one : ∀ a : carrier, multiplication a one = a
  left_distrib : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  right_distrib : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)
  support : G → Prop
  support_finite : ∀ x : carrier, Set.Finite {g : G | support g}
  representation : carrier → (G → R)
  representation_inj : Function.Injective representation

structure InfiniteGroup (G : Type u) [Group G] where
  carrier : Type u
  group : Group carrier
  infinite : Infinite carrier

structure ModuleOverGroupRing (G : Type u) [Group G] (R : Type v) [CommRing R]
  (RG : GroupRing G R) (M : Type w) [AddCommGroup M] where
  smul : RG.carrier → M → M
  smul_add : ∀ (r : RG.carrier) (x y : M), smul r (x + y) = smul r x + smul r y
  add_smul : ∀ (r s : RG.carrier) (x : M), smul (RG.addition r s) x = smul r x + smul s x
  mul_smul : ∀ (r s : RG.carrier) (x : M), smul (RG.multiplication r s) x = smul r (smul s x)
  one_smul : ∀ (x : M), smul RG.one x = x
  smul_zero : ∀ (r : RG.carrier), smul r 0 = 0
  zero_smul : ∀ (x : M), smul RG.zero x = 0

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse