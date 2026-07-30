import HautevilleHouse.MembranesLemmaCanonicalLaneLean.MembraneEnergy

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MinimalSurfaceEquationPackage {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T} where
  eulerLagrangeEquation : Prop
  meanCurvatureZero : Prop
  weakSolutionDefined : Prop
  regularityAssumptions : Prop

structure MinimalSurfaceEquationEvidence {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    (P : MinimalSurfaceEquationPackage) where
  eulerLagrangeEquationClosed : P.eulerLagrangeEquation
  meanCurvatureZeroClosed : P.meanCurvatureZero
  weakSolutionDefinedClosed : P.weakSolutionDefined
  regularityAssumptionsClosed : P.regularityAssumptions

def MinimalSurfaceEquationClosed {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    (P : MinimalSurfaceEquationPackage) : Prop :=
  P.eulerLagrangeEquation ∧ P.meanCurvatureZero ∧
  P.weakSolutionDefined ∧ P.regularityAssumptions

theorem minimal_surface_equation_closed_from_evidence
    {M : MembraneSurfacePackage} {T : MembraneTopologyEvidence M}
    {E : MembraneEnergyPackage T} (P : MinimalSurfaceEquationPackage)
    (Ev : MinimalSurfaceEquationEvidence P) : MinimalSurfaceEquationClosed P := by
  exact And.intro Ev.eulerLagrangeEquationClosed
    (And.intro Ev.meanCurvatureZeroClosed
      (And.intro Ev.weakSolutionDefinedClosed Ev.regularityAssumptionsClosed))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse