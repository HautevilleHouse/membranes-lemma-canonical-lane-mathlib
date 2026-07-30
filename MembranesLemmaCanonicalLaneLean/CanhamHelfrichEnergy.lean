import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MembranesLemmaCanonicalLaneLean.MembraneElasticity

/-!
# Canham–Helfrich Energy Package
-/

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure CanhamHelfrichEnergyPackage {E : MembraneElasticityPackage} where
  meanCurvatureSquared : Prop
  gaussianCurvature : Prop
  bendingModulus : Prop
  gaussianModulus : Prop
  surfaceTension : Prop
  pressureDifference : Prop
  areaConstraint : Prop
  volumeConstraint : Prop
  energyFunctional : Type u
  variationalDerivative : Type v

structure CanhamHelfrichEnergyEvidence {E : MembraneElasticityPackage}
    (CH : CanhamHelfrichEnergyPackage E) where
  meanCurvatureSquaredClosed : CH.meanCurvatureSquared
  gaussianCurvatureClosed : CH.gaussianCurvature
  bendingModulusClosed : CH.bendingModulus
  gaussianModulusClosed : CH.gaussianModulus
  surfaceTensionClosed : CH.surfaceTension
  pressureDifferenceClosed : CH.pressureDifference
  areaConstraintClosed : CH.areaConstraint
  volumeConstraintClosed : CH.volumeConstraint

def CanhamHelfrichEnergyClosed {E : MembraneElasticityPackage}
    (CH : CanhamHelfrichEnergyPackage E) : Prop :=
  CH.meanCurvatureSquared ∧ CH.gaussianCurvature ∧ CH.bendingModulus ∧
  CH.gaussianModulus ∧ CH.surfaceTension ∧ CH.pressureDifference ∧
  CH.areaConstraint ∧ CH.volumeConstraint

theorem canham_helfrich_energy_closed_from_evidence
    {E : MembraneElasticityPackage} (CH : CanhamHelfrichEnergyPackage E)
    (Ev : CanhamHelfrichEnergyEvidence CH) : CanhamHelfrichEnergyClosed CH := by
  exact And.intro Ev.meanCurvatureSquaredClosed
    (And.intro Ev.gaussianCurvatureClosed
      (And.intro Ev.bendingModulusClosed
        (And.intro Ev.gaussianModulusClosed
          (And.intro Ev.surfaceTensionClosed
            (And.intro Ev.pressureDifferenceClosed
              (And.intro Ev.areaConstraintClosed Ev.volumeConstraintClosed))))))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse
