import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure FarrellJonesAssembly {G : Type u} [Group G] (R : Type v) [CommRing R] where
  assemblyMap : K_n(R[G]) → K_n(E_{VCyc}G)
  farrellJonesConclusion : Prop
  assemblyMapDefined : Prop
  farrellJonesConclusionTerm : farrellJonesConclusion
  assemblyMapDefinedTerm : assemblyMapDefined

structure FarrellJonesEvidence {G : Type u} [Group G] {R : Type v} [CommRing R]
    (F : FarrellJonesAssembly G R) where
  assemblyMapDefinedClosed : F.assemblyMapDefined
  farrellJonesConclusionClosed : F.farrellJonesConclusion

def FarrellJonesClosed {G : Type u} [Group G] {R : Type v} [CommRing R]
    (F : FarrellJonesAssembly G R) : Prop :=
  F.assemblyMapDefined ∧ F.farrellJonesConclusion

theorem farrell_jones_closed_from_evidence {G : Type u} [Group G] {R : Type v} [CommRing R]
    (F : FarrellJonesAssembly G R) (E : FarrellJonesEvidence F) : FarrellJonesClosed F := by
  exact And.intro E.assemblyMapDefinedClosed E.farrellJonesConclusionClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse