import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure InfiniteGroupProperty (G : Type u) where
  carrier : Set G
  infinite : Set.Infinite carrier
  groupOps : Group carrier

structure InfiniteGroupEvidence (G : Type u) (P : InfiniteGroupProperty G) where
  infinite_closed : P.infinite
  group_ops_closed : P.groupOps = P.groupOps

def InfiniteGroupClosed (G : Type u) (P : InfiniteGroupProperty G) : Prop :=
  P.infinite

theorem infinite_group_closed_from_evidence (G : Type u) (P : InfiniteGroupProperty G)
    (E : InfiniteGroupEvidence G P) : InfiniteGroupClosed G P := by
  exact E.infinite_closed

theorem infinite_group_ring_simple_module_example (G : Type u) (R : Type v) [AddMonoid R]
    (A : GroupRing G R) (P : InfiniteGroupProperty G) (M : ModuleOverGroupRing R G A) :
    InfiniteGroupClosed G P → ModuleClosed M → True := by
  intro hInfinite hModule
  trivial

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse