import HautevilleHouse.MembranesLemmaCanonicalLaneLean.PlateauProblem

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure WillmoreConjecturePackage {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    {P : MinimalSurfaceEquationPackage} {Q : PlateauProblemPackage} where
  willmoreEnergyLowerBound : Prop
  roundSphereMinimizer : Prop
  genusZeroCase : Prop
  conformalInvariance : Prop

structure WillmoreConjectureEvidence {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    {P : MinimalSurfaceEquationPackage} {Q : PlateauProblemPackage}
    (W : WillmoreConjecturePackage) where
  willmoreEnergyLowerBoundClosed : W.willmoreEnergyLowerBound
  roundSphereMinimizerClosed : W.roundSphereMinimizer
  genusZeroCaseClosed : W.genusZeroCase
  conformalInvarianceClosed : W.conformalInvariance

def WillmoreConjectureClosed {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    {P : MinimalSurfaceEquationPackage} {Q : PlateauProblemPackage}
    (W : WillmoreConjecturePackage) : Prop :=
  W.willmoreEnergyLowerBound ∧ W.roundSphereMinimizer ∧
  W.genusZeroCase ∧ W.conformalInvariance

theorem willmore_conjecture_closed_from_evidence {M : MembraneSurfacePackage}
    {T : MembraneTopologyEvidence M} {E : MembraneEnergyPackage T}
    {P : MinimalSurfaceEquationPackage} {Q : PlateauProblemPackage}
    (W : WillmoreConjecturePackage) (Ev : WillmoreConjectureEvidence W) :
    WillmoreConjectureClosed W := by
  exact And.intro Ev.willmoreEnergyLowerBoundClosed
    (And.intro Ev.roundSphereMinimizerClosed
      (And.intro Ev.genusZeroCaseClosed Ev.conformalInvarianceClosed))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse