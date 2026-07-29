import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupRingPackage (G : Type u) [Group G] (R : Type v) [CommRing R] where
  underlyingAddGroup : AddGroup (R[G])
  multiplication : R[G] → R[G] → R[G]
  ringAxioms : Prop
  groupRingIdentified : Prop
  ringAxiomsTerm : ringAxioms
  groupRingIdentifiedTerm : groupRingIdentified

structure GroupRingEvidence {G : Type u} [Group G] {R : Type v} [CommRing R]
    (P : GroupRingPackage G R) where
  ringAxiomsClosed : P.ringAxioms
  groupRingIdentifiedClosed : P.groupRingIdentified

def GroupRingClosed {G : Type u} [Group G] {R : Type v} [CommRing R]
    (P : GroupRingPackage G R) : Prop :=
  P.ringAxioms ∧ P.groupRingIdentified

theorem group_ring_closed_from_evidence {G : Type u} [Group G] {R : Type v} [CommRing R]
    (P : GroupRingPackage G R) (E : GroupRingEvidence P) : GroupRingClosed P := by
  exact And.intro E.ringAxiomsClosed E.groupRingIdentifiedClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse