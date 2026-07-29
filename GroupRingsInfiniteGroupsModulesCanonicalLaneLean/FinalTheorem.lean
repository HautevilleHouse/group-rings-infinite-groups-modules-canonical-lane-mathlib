import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

def ConstrainedGroupRingsInfiniteGroupsModulesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_group_rings_infinite_groups_modules_endgame (A : AdmissibleClass) :
    ConstrainedGroupRingsInfiniteGroupsModulesClosure A :=
by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse
