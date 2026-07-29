import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingModule

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure CrossedProductModule (G : Type u) [Group G] (N : Type v) [Group N] [GroupHom G (Aut N)] where
  underlyingModule : GroupRingModule (SemidirectProduct N G)
  twistedAction : Prop
  crossedProductStructure : Prop

structure CrossedProductModuleEvidence (M : CrossedProductModule G N) where
  twistedActionClosed : M.twistedAction
  crossedProductStructureClosed : M.crossedProductStructure

def CrossedProductModuleClosed (M : CrossedProductModule G N) : Prop :=
  M.twistedAction ∧ M.crossedProductStructure

theorem crossed_product_module_closed_from_evidence (M : CrossedProductModule G N) (E : CrossedProductModuleEvidence M) :
    CrossedProductModuleClosed M := by
  exact And.intro E.twistedActionClosed E.crossedProductStructureClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse