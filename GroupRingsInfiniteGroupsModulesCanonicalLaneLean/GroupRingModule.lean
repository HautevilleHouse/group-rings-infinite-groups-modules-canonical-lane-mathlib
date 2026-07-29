import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupRingModule (G : Type u) [Group G] where
  carrier : Type v
  module : Module (GroupRing G) carrier
  finitelyGenerated : Prop
  noetherian : Prop

structure GroupRingModuleEvidence (M : GroupRingModule G) where
  finitelyGeneratedClosed : M.finitelyGenerated
  noetherianClosed : M.noetherian

def GroupRingModuleClosed (M : GroupRingModule G) : Prop :=
  M.finitelyGenerated ∧ M.noetherian

theorem group_ring_module_closed_from_evidence (M : GroupRingModule G) (E : GroupRingModuleEvidence M) :
    GroupRingModuleClosed M := by
  exact And.intro E.finitelyGeneratedClosed E.noetherianClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse