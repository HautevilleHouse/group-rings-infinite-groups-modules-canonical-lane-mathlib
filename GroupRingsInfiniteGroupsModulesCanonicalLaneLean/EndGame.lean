import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

def ConstrainedGroupRingInfiniteModuleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_group_ring_infinite_module_endgame (A : AdmissibleClass) :
    ConstrainedGroupRingInfiniteModuleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse