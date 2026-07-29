import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingModule

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure ProjectiveDimensionData (G : Type u) [Group G] where
  module : GroupRingModule G
  projectiveResolution : Nat
  finiteProjectiveDimension : Prop
  pdBound : Nat

structure ProjectiveDimensionEvidence (D : ProjectiveDimensionData G) where
  finiteProjectiveDimensionClosed : D.finiteProjectiveDimension
  pdBoundClosed : D.pdBound = D.projectiveResolution

def ProjectiveDimensionClosed (D : ProjectiveDimensionData G) : Prop :=
  D.finiteProjectiveDimension ∧ D.pdBound = D.projectiveResolution

theorem projective_dimension_closed_from_evidence (D : ProjectiveDimensionData G) (E : ProjectiveDimensionEvidence D) :
    ProjectiveDimensionClosed D := by
  exact And.intro E.finiteProjectiveDimensionClosed E.pdBoundClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse