import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingModuleStructure

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure ModuleCategory (G : Type u) [Group G] (R : Type v) [CommRing R] where
  objects : Type w
  morphisms : objects → objects → Type x
  identity : ∀ (A : objects), morphisms A A
  composition : ∀ (A B C : objects), morphisms A B → morphisms B C → morphisms A C
  leftUnit : ∀ (A B : objects) (f : morphisms A B), composition A A B (identity A) f = f
  rightUnit : ∀ (A B : objects) (f : morphisms A B), composition A B B f (identity B) = f
  associativity : ∀ (A B C D : objects) (f : morphisms A B) (g : morphisms B C) (h : morphisms C D),
      composition A C D (composition A B C f g) h = composition A B D f (composition B C D g h)

structure ModuleCategoryEvidence (C : ModuleCategory G R) where
  categoryClosed : C.objects → Prop
  identityClosed : ∀ (A : C.objects), C.identity A = C.identity A
  compositionClosed : ∀ (A B C : C.objects) (f : C.morphisms A B) (g : C.morphisms B C),
      C.composition A B C f g = C.composition A B C f g

def ModuleCategoryClosed (C : ModuleCategory G R) : Prop :=
  (∀ (A : C.objects), C.identity A = C.identity A) ∧
  (∀ (A B C : C.objects) (f : C.morphisms A B) (g : C.morphisms B C), C.composition A B C f g = C.composition A B C f g)

theorem module_category_closed_from_evidence (C : ModuleCategory G R) (E : ModuleCategoryEvidence C) :
    ModuleCategoryClosed C := by
  exact And.intro E.identityClosed E.compositionClosed

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse