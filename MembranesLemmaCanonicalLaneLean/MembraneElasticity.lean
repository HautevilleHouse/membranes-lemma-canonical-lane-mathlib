import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembraneElasticityPackage where
  surfaceTension : ℝ
  bendingRigidity : ℝ
  spontaneousCurvature : ℝ
  adhesionEnergy : ℝ
  equilibriumCondition : Prop

structure MembraneElasticityEvidence (E : MembraneElasticityPackage) where
  surfaceTensionPositive : E.surfaceTension > 0
  bendingRigidityPositive : E.bendingRigidity > 0
  equilibriumConditionClosed : E.equilibriumCondition

def MembraneElasticityClosed (E : MembraneElasticityPackage) : Prop :=
  E.surfaceTension > 0 ∧ E.bendingRigidity > 0 ∧ E.equilibriumCondition

theorem membrane_elasticity_closed_from_evidence (E : MembraneElasticityPackage)
    (ev : MembraneElasticityEvidence E) : MembraneElasticityClosed E := by
  exact And.intro ev.surfaceTensionPositive
    (And.intro ev.bendingRigidityPositive ev.equilibriumConditionClosed)

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse