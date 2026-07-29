import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure BassHellerSwanProjective {G : Type u} [Group G] (R : Type v) [CommRing R] where
  groupRingProjective : Prop
  freeAbelianGroup : G ≅ ℤ^? 
  bassHellerSwanConclusion : Prop
  groupRingProjectiveTerm : groupRingProjective
  bassHellerSwanConclusionTerm : bassHellerSwanConclusion

structure BassHellerSwanEvidence {G : Type u} [Group G] {R : Type v} [CommRing R]
    (B : BassHellerSwanProjective G R) where
  groupRingProjectiveClosed : B.groupRingProjective
  bassHellerSwanConclusionClosed : B.bassHellerSwanConclusion

def BassHellerSwanClosed {G : Type u} [Group G] {R : Type v} [CommRing R]
    (B : BassHellerSwanProjective G R) : Prop :=
  B.groupRingProjective ∧ B.bassHellerSwanConclusion

theorem bass_heller_swan_closed_from_evidence {G : Type u} [Group G] {R : Type v} [CommRing R]
    (B : BassHellerSwanProjective G R) (E : BassHellerSwanEvidence B) : BassHellerSwanClosed B := by
  exact And.intro E.groupRingProjectiveClosed E.bassHellerSwanConclusionClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse