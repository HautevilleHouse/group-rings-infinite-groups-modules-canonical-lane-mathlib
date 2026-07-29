import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingAndModuleFoundation

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure ProjectiveResolutionPackage (G : Type u) [Group G] (R : Type v) [Ring R] where
  groupRing : GroupRing G
  module : ModuleOverGroupRing (groupRing.carrier) (Type w)
  resolutionChain : Nat → (module.smul.carrier → module.smul.carrier)
  exactness : Prop
  projectivity : Prop
  exactnessClosed : exactness
  projectivityClosed : projectivity

structure ProjectiveResolutionEvidence {G : Type u} [Group G] {R : Type v} [Ring R] {W : Type w} 
  (P : ProjectiveResolutionPackage G R) where
  exactnessFulfilled : P.exactness
  projectivityFulfilled : P.projectivity

def ProjectiveResolutionClosed {G : Type u} [Group G] {R : Type v} [Ring R] 
  (P : ProjectiveResolutionPackage G R) : Prop :=
  P.exactness ∧ P.projectivity

theorem projective_resolution_closed_from_evidence {G : Type u} [Group G] {R : Type v} [Ring R] 
  (P : ProjectiveResolutionPackage G R) (E : ProjectiveResolutionEvidence P) : 
  ProjectiveResolutionClosed P :=
by
  exact And.intro E.exactnessFulfilled E.projectivityFulfilled

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse
