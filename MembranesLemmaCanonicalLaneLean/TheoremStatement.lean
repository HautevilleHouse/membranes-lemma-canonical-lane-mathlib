import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembraneObject where
  carrier : Type
  topology : TopologicalSpace carrier
  membraneCondition : Prop
  conclusion : membraneCondition

structure MembraneEndgameState where
  object : MembraneObject

def membraneWitnessClosed (O : MembraneObject) : Prop :=
  O.membraneCondition

theorem membraneEndgameStateConclusion (s : MembraneEndgameState) :
    membraneWitnessClosed s.object := by
  exact s.object.conclusion

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse
