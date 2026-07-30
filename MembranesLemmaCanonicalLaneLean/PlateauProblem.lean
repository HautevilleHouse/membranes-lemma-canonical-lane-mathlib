import HautevilleHouse.MembranesLemmaCanonicalLaneLean.MinimalSurfaceEquation

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure PlateauProblemPackage {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    {P : MinimalSurfaceEquationPackage} where
  boundaryCurveFixed : Prop
  areaMinimizingProperty : Prop
  existenceResult : Prop
  regularityResult : Prop

structure PlateauProblemEvidence {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    {P : MinimalSurfaceEquationPackage} (Q : PlateauProblemPackage) where
  boundaryCurveFixedClosed : Q.boundaryCurveFixed
  areaMinimizingPropertyClosed : Q.areaMinimizingProperty
  existenceResultClosed : Q.existenceResult
  regularityResultClosed : Q.regularityResult

def PlateauProblemClosed {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    {P : MinimalSurfaceEquationPackage} (Q : PlateauProblemPackage) : Prop :=
  Q.boundaryCurveFixed ∧ Q.areaMinimizingProperty ∧
  Q.existenceResult ∧ Q.regularityResult

theorem plateau_problem_closed_from_evidence {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    {P : MinimalSurfaceEquationPackage} (Q : PlateauProblemPackage)
    (Ev : PlateauProblemEvidence Q) : PlateauProblemClosed Q := by
  exact And.intro Ev.boundaryCurveFixedClosed
    (And.intro Ev.areaMinimizingPropertyClosed
      (And.intro Ev.existenceResultClosed Ev.regularityResultClosed))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse