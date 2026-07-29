import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupRingModule (G : Type u) [Group G] (R : Type v) [CommRing R] where
  carrier : Type w
  module : Module R carrier
  action : G → carrier → carrier
  action_linear : ∀ (g : G) (x y : carrier), action g (x + y) = action g x + action g y
  action_compat : ∀ (g h : G) (x : carrier), action (g * h) x = action g (action h x)
  action_smul : ∀ (g : G) (r : R) (x : carrier), action g (r • x) = r • action g x

structure GroupRingModuleEvidence (M : GroupRingModule G R) where
  moduleClosed : M.module
  actionLinearClosed : ∀ (g : G) (x y : M.carrier), M.action g (x + y) = M.action g x + M.action g y
  actionCompatClosed : ∀ (g h : G) (x : M.carrier), M.action (g * h) x = M.action g (M.action h x)
  actionSmulClosed : ∀ (g : G) (r : R) (x : M.carrier), M.action g (r • x) = r • M.action g x

def GroupRingModuleClosed (M : GroupRingModule G R) : Prop :=
  M.module ∧
  (∀ (g : G) (x y : M.carrier), M.action g (x + y) = M.action g x + M.action g y) ∧
  (∀ (g h : G) (x : M.carrier), M.action (g * h) x = M.action g (M.action h x)) ∧
  (∀ (g : G) (r : R) (x : M.carrier), M.action g (r • x) = r • M.action g x)

theorem group_ring_module_closed_from_evidence (M : GroupRingModule G R) (E : GroupRingModuleEvidence M) :
    GroupRingModuleClosed M := by
  refine And.intro E.moduleClosed (And.intro ?_ (And.intro ?_ ?_))
  · exact E.actionLinearClosed
  · exact E.actionCompatClosed
  · exact E.actionSmulClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse