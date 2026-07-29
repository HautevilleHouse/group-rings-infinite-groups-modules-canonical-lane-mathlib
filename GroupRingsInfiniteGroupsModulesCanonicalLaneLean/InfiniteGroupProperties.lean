import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure InfiniteGroup (G : Type u) [Group G] where
  carrier : Set G
  infinite : Infinite carrier
  subgroup : Subgroup G
  subgroupCarrier : subgroup.carrier = carrier

structure InfiniteGroupEvidence (G : InfiniteGroup) where
  infiniteClosed : G.infinite
  subgroupClosed : G.subgroup
  carrierClosed : G.subgroupCarrier

def InfiniteGroupClosed (G : InfiniteGroup) : Prop :=
  G.infinite ∧ G.subgroup ∧ G.subgroupCarrier

theorem infinite_group_closed_from_evidence (G : InfiniteGroup) (E : InfiniteGroupEvidence G) :
    InfiniteGroupClosed G := by
  exact And.intro E.infiniteClosed (And.intro E.subgroupClosed E.carrierClosed)

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse