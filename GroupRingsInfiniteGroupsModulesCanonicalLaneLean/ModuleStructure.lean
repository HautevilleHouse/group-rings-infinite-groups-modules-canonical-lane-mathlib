import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure ModuleOverGroupRing (R : Type u) (G : Type v) [AddMonoid R] (A : GroupRing G R) where
  carrier : Type w
  zero : carrier
  add : carrier → carrier → carrier
  smul : A.carrier → carrier → carrier
  add_assoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  add_comm : ∀ x y : carrier, add x y = add y x
  zero_add : ∀ x : carrier, add zero x = x
  add_zero : ∀ x : carrier, add x zero = x
  smul_distr_r : ∀ r s : A.carrier, ∀ x : carrier, smul (r + s) x = add (smul r x) (smul s x)
  smul_distr_l : ∀ r : A.carrier, ∀ x y : carrier, smul r (add x y) = add (smul r x) (smul r y)
  smul_assoc : ∀ r s : A.carrier, ∀ x : carrier, smul (smul r x) s = smul r (smul s x)

def ModuleAdmissible {R : Type u} {G : Type v} [AddMonoid R] {A : GroupRing G R}
    (M : ModuleOverGroupRing R G A) : Prop :=
  ∀ r : A.carrier, ∀ x : M.carrier, M.smul r x = M.smul r x

structure ModuleEvidence {R : Type u} {G : Type v} [AddMonoid R] {A : GroupRing G R}
    (M : ModuleOverGroupRing R G A) where
  add_assoc_closed : M.add_assoc
  add_comm_closed : M.add_comm
  zero_add_closed : M.zero_add
  add_zero_closed : M.add_zero
  smul_distr_r_closed : M.smul_distr_r
  smul_distr_l_closed : M.smul_distr_l
  smul_assoc_closed : M.smul_assoc

def ModuleClosed {R : Type u} {G : Type v} [AddMonoid R] {A : GroupRing G R}
    (M : ModuleOverGroupRing R G A) : Prop :=
  M.add_assoc ∧ M.add_comm ∧ M.zero_add ∧ M.add_zero ∧
  M.smul_distr_r ∧ M.smul_distr_l ∧ M.smul_assoc

theorem module_closed_from_evidence {R : Type u} {G : Type v} [AddMonoid R] {A : GroupRing G R}
    (M : ModuleOverGroupRing R G A) (E : ModuleEvidence M) : ModuleClosed M := by
  exact And.intro E.add_assoc_closed (And.intro E.add_comm_closed (And.intro E.zero_add_closed
    (And.intro E.add_zero_closed (And.intro E.smul_distr_r_closed (And.intro E.smul_distr_l_closed E.smul_assoc_closed)))))

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse