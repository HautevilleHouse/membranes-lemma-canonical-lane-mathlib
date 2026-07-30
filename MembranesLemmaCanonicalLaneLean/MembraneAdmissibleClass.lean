import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembraneAdmittedObject where
  membraneShapePackage : MembraneShapePackage
  membranePDE : MembranePDEPackage membraneShapePackage
  elasticEnergy : MembraneElasticEnergyPackage membranePDE
  phaseTransitions : MembranePhaseTransitionsPackage elasticEnergy
  shapeClosed : Prop
  pdeClosed : Prop
  energyClosed : Prop
  phaseClosed : Prop
  conclusion : shapeClosed ∧ pdeClosed ∧ energyClosed ∧ phaseClosed

structure MembraneEndgameState where
  object : MembraneAdmittedObject

def MembraneWitnessClosed (O : MembraneAdmittedObject) : Prop :=
  O.conclusion

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse