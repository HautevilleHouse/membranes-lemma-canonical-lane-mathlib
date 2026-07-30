import MembranesLemmaCanonicalLaneLean.MembranePDE

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembraneElasticEnergyPackage {M : MembraneShapePackage} (P : MembranePDEPackage M) where
  canhamHelfrichEnergy : Prop
  bendingRigidity : Prop
  gaussianRigidity : Prop
  areaDifferenceEnergy : Prop
  lineTension : Prop

structure MembraneElasticEnergyEvidence {M : MembraneShapePackage} {P : MembranePDEPackage M} (E : MembraneElasticEnergyPackage P) where
  canhamHelfrichEnergyClosed : E.canhamHelfrichEnergy
  bendingRigidityClosed : E.bendingRigidity
  gaussianRigidityClosed : E.gaussianRigidity
  areaDifferenceEnergyClosed : E.areaDifferenceEnergy
  lineTensionClosed : E.lineTension

def MembraneElasticEnergyClosed {M : MembraneShapePackage} {P : MembranePDEPackage M} (E : MembraneElasticEnergyPackage P) : Prop :=
  E.canhamHelfrichEnergy ∧ E.bendingRigidity ∧ E.gaussianRigidity ∧ E.areaDifferenceEnergy ∧ E.lineTension

theorem membrane_elastic_energy_closed_from_evidence {M : MembraneShapePackage} {P : MembranePDEPackage M} (E : MembraneElasticEnergyPackage P) (Ev : MembraneElasticEnergyEvidence E) : MembraneElasticEnergyClosed E := by
  exact And.intro Ev.canhamHelfrichEnergyClosed
    (And.intro Ev.bendingRigidityClosed
      (And.intro Ev.gaussianRigidityClosed
        (And.intro Ev.areaDifferenceEnergyClosed Ev.lineTensionClosed)))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse