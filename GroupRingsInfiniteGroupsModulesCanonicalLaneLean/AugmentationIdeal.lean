import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingModuleStructure

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure AugmentationIdeal (G : Type u) [Group G] (R : Type v) [CommRing R] where
  groupRing : GroupRingModule G R
  ideal : Ideal (groupRing.carrier)
  augmentationMap : (groupRing.carrier) → R
  kernel : augmentationMap⁻¹' {0} = ideal
  augmentationMap_linear : LinearMap (groupRing.module) (moduleOf R) augmentationMap

structure AugmentationIdealEvidence (A : AugmentationIdeal G R) where
  idealClosed : A.ideal
  kernelClosed : A.kernel
  mapLinearClosed : A.augmentationMap_linear

def AugmentationIdealClosed (A : AugmentationIdeal G R) : Prop :=
  A.ideal ∧ A.kernel ∧ A.augmentationMap_linear

theorem augmentation_ideal_closed_from_evidence (A : AugmentationIdeal G R) (E : AugmentationIdealEvidence A) :
    AugmentationIdealClosed A := by
  exact And.intro E.idealClosed (And.intro E.kernelClosed E.mapLinearClosed)

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse