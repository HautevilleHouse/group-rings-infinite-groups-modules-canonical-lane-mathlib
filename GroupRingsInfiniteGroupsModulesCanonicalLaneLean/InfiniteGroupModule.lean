import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure InfiniteGroupModule (G : Type u) [Group G] [Infinite G] (R : Type v) [CommRing R] where
  moduleOverGroupRing : Module (R[G]) (R[G])
  action : G → R[G] → R[G]
  infiniteGroupActionFaithful : Prop
  moduleAxioms : Prop
  infiniteGroupActionFaithfulTerm : infiniteGroupActionFaithful
  moduleAxiomsTerm : moduleAxioms

structure InfiniteGroupModuleEvidence {G : Type u} [Group G] [Infinite G] {R : Type v} [CommRing R]
    (M : InfiniteGroupModule G R) where
  infiniteGroupActionFaithfulClosed : M.infiniteGroupActionFaithful
  moduleAxiomsClosed : M.moduleAxioms

def InfiniteGroupModuleClosed {G : Type u} [Group G] [Infinite G] {R : Type v} [CommRing R]
    (M : InfiniteGroupModule G R) : Prop :=
  M.infiniteGroupActionFaithful ∧ M.moduleAxioms

theorem infinite_group_module_closed_from_evidence {G : Type u} [Group G] [Infinite G] {R : Type v} [CommRing R]
    (M : InfiniteGroupModule G R) (E : InfiniteGroupModuleEvidence M) : InfiniteGroupModuleClosed M := by
  exact And.intro E.infiniteGroupActionFaithfulClosed E.moduleAxiomsClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse