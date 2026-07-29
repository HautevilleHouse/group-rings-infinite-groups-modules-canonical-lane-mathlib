import GroupRingsInfiniteGroupsModulesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GroupRingsInfiniteGroupsModulesCanonicalLaneLean

structure GroupRingAdmittedObject where
  ring : Type u
  group : Type v
  groupRing : Type w
  module : Type x
  ringStructure : Prop
  groupStructure : Prop
  groupRingStructure : Prop
  moduleStructure : Prop
  conclusion : Prop

structure GroupRingEndgameState where
  object : GroupRingAdmittedObject

def GroupRingWitnessClosed (O : GroupRingAdmittedObject) : Prop :=
  O.conclusion

end GroupRingsInfiniteGroupsModulesCanonicalLaneLean
end HautevilleHouse