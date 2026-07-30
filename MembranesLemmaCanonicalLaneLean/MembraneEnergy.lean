import HautevilleHouse.MembranesLemmaCanonicalLaneLean.MembraneTopology

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembraneEnergyPackage {M : MembraneSurfacePackage} (T : MembraneTopologyEvidence M) where
  willmoreFunctional : Prop
  bendingEnergy : Prop
  tensionTerm : Prop
  boundaryConditions : Prop
  energyFunctionalDefined : Prop

structure MembraneEnergyEvidence {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} (E : MembraneEnergyPackage T) where
  willmoreFunctionalClosed : E.willmoreFunctional
  bendingEnergyClosed : E.bendingEnergy
  tensionTermClosed : E.tensionTerm
  boundaryConditionsClosed : E.boundaryConditions
  energyFunctionalDefinedClosed : E.energyFunctionalDefined

def MembraneEnergyClosed {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} (E : MembraneEnergyPackage T) : Prop :=
  E.willmoreFunctional ∧ E.bendingEnergy ∧ E.tensionTerm ∧
  E.boundaryConditions ∧ E.energyFunctionalDefined

theorem membrane_energy_closed_from_evidence {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} (E : MembraneEnergyPackage T)
    (Ev : MembraneEnergyEvidence E) : MembraneEnergyClosed E := by
  exact And.intro Ev.willmoreFunctionalClosed
    (And.intro Ev.bendingEnergyClosed
      (And.intro Ev.tensionTermClosed
        (And.intro Ev.boundaryConditionsClosed Ev.energyFunctionalDefinedClosed)))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse