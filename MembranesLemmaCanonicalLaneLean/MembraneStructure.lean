import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembraneSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MembraneAdmittedObject where
  space : MembraneSpace
  boundaryConstrained : Prop
  internalFields : Prop
  conclusion : internalFields

def membraneWitnessClosed (O : MembraneAdmittedObject) : Prop :=
  O.internalFields

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse
