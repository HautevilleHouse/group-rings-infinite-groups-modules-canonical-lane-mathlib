import GroupRingsInfiniteGroupsModulesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure AdmissibleClass where
  object : GroupRingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GroupRingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse