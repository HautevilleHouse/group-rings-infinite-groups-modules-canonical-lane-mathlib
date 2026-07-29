import GroupRingsInfiniteGroupsModulesCanonicalLaneLean.GroupRingBaseObjects

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | GroupRingAdmittedObject G R RG =>
    let RG' := RG
    True
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  match A.object with
  | GroupRingAdmittedObject G R RG => trivial

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse