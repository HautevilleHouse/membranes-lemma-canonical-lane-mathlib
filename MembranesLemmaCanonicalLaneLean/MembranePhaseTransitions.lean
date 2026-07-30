import MembranesLemmaCanonicalLaneLean.MembraneElasticEnergy

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembranePhaseTransitionsPackage {M : MembraneShapePackage} {P : MembranePDEPackage M} {E : MembraneElasticEnergyPackage P} where
  spontaneousCurvatureTransition : Prop
  poreFormationEnergy : Prop
  buddingPathway : Prop
  vesicleScission : Prop

structure MembranePhaseTransitionsEvidence {M : MembraneShapePackage} {P : MembranePDEPackage M} {E : MembraneElasticEnergyPackage P} (T : MembranePhaseTransitionsPackage E) where
  spontaneousCurvatureTransitionClosed : T.spontaneousCurvatureTransition
  poreFormationEnergyClosed : T.poreFormationEnergy
  buddingPathwayClosed : T.buddingPathway
  vesicleScissionClosed : T.vesicleScission

def MembranePhaseTransitionsClosed {M : MembraneShapePackage} {P : MembranePDEPackage M} {E : MembraneElasticEnergyPackage P} (T : MembranePhaseTransitionsPackage E) : Prop :=
  T.spontaneousCurvatureTransition ∧ T.poreFormationEnergy ∧ T.buddingPathway ∧ T.vesicleScission

theorem membrane_phase_transitions_closed_from_evidence {M : MembraneShapePackage} {P : MembranePDEPackage M} {E : MembraneElasticEnergyPackage P} (T : MembranePhaseTransitionsPackage E) (Ev : MembranePhaseTransitionsEvidence T) : MembranePhaseTransitionsClosed T := by
  exact And.intro Ev.spontaneousCurvatureTransitionClosed
    (And.intro Ev.poreFormationEnergyClosed
      (And.intro Ev.buddingPathwayClosed Ev.vesicleScissionClosed))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse