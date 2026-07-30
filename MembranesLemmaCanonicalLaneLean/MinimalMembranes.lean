import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MembranesLemmaCanonicalLaneLean.ShapeEquation

/-!
# Minimal Membranes Package
-/

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MinimalMembranesPackage {E : MembraneElasticityPackage}
    {CH : CanhamHelfrichEnergyPackage E} {S : ShapeEquationPackage CH} where
  zeroSpontaneousCurvature : Prop
  constantMeanCurvature : Prop
  areaDifferenceVanishes : Prop
  stressFreeConfiguration : Prop
  willmoreEnergyMinimal : Prop
  axisymmetricSolution : Prop
  boundaryConditionMinimal : Prop

structure MinimalMembranesEvidence {E : MembraneElasticityPackage}
    {CH : CanhamHelfrichEnergyPackage E} {S : ShapeEquationPackage CH}
    (M : MinimalMembranesPackage S) where
  zeroSpontaneousCurvatureClosed : M.zeroSpontaneousCurvature
  constantMeanCurvatureClosed : M.constantMeanCurvature
  areaDifferenceVanishesClosed : M.areaDifferenceVanishes
  stressFreeConfigurationClosed : M.stressFreeConfiguration
  willmoreEnergyMinimalClosed : M.willmoreEnergyMinimal
  axisymmetricSolutionClosed : M.axisymmetricSolution
  boundaryConditionMinimalClosed : M.boundaryConditionMinimal

def MinimalMembranesClosed {E : MembraneElasticityPackage}
    {CH : CanhamHelfrichEnergyPackage E} {S : ShapeEquationPackage CH}
    (M : MinimalMembranesPackage S) : Prop :=
  M.zeroSpontaneousCurvature ∧ M.constantMeanCurvature ∧
  M.areaDifferenceVanishes ∧ M.stressFreeConfiguration ∧
  M.willmoreEnergyMinimal ∧ M.axisymmetricSolution ∧
  M.boundaryConditionMinimal

theorem minimal_membranes_closed_from_evidence
    {E : MembraneElasticityPackage} {CH : CanhamHelfrichEnergyPackage E}
    {S : ShapeEquationPackage CH} (M : MinimalMembranesPackage S)
    (Ev : MinimalMembranesEvidence M) : MinimalMembranesClosed M := by
  exact And.intro Ev.zeroSpontaneousCurvatureClosed
    (And.intro Ev.constantMeanCurvatureClosed
      (And.intro Ev.areaDifferenceVanishesClosed
        (And.intro Ev.stressFreeConfigurationClosed
          (And.intro Ev.willmoreEnergyMinimalClosed
            (And.intro Ev.axisymmetricSolutionClosed Ev.boundaryConditionMinimalClosed)))))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse
