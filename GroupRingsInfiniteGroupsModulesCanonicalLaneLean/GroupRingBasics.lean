import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupRing (G : Type u) (R : Type v) [AddMonoid R] where
  carrier : R → G → R
  zero_mul : ∀ r : R, carrier r 0 = 0
  add_mul : ∀ r s : R, ∀ g : G, carrier (r + s) g = carrier r g + carrier s g
  mul_add : ∀ r : R, ∀ g h : G, carrier r (g + h) = carrier r g + carrier r h
  mul_assoc : ∀ r : R, ∀ g h : G, carrier (carrier r g) h = carrier r (g + h)

def GroupRingAdmissible {G : Type u} {R : Type v} [AddMonoid R] (A : GroupRing G R) : Prop :=
  ∀ r : R, ∀ g : G, A.carrier r g = A.carrier r g

structure GroupRingEvidence {G : Type u} {R : Type v} [AddMonoid R] (A : GroupRing G R) where
  zero_mul_closed : A.zero_mul
  add_mul_closed : A.add_mul
  mul_add_closed : A.mul_add
  mul_assoc_closed : A.mul_assoc

def GroupRingClosed {G : Type u} {R : Type v} [AddMonoid R] (A : GroupRing G R) : Prop :=
  A.zero_mul ∧ A.add_mul ∧ A.mul_add ∧ A.mul_assoc

theorem group_ring_closed_from_evidence {G : Type u} {R : Type v} [AddMonoid R]
    (A : GroupRing G R) (E : GroupRingEvidence A) : GroupRingClosed A := by
  exact And.intro E.zero_mul_closed (And.intro E.add_mul_closed (And.intro E.mul_add_closed E.mul_assoc_closed))

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse