import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembraneShapePackage where
  surfaceType : Type u
  embeddingDimension : Nat
  meanCurvatureDefined : Prop
  elasticEnergyFunctional : Prop
  spontaneousCurvatureParam : Prop

structure MembraneShapeEvidence (M : MembraneShapePackage) where
  surfaceTypeClosed : M.surfaceType
  embeddingDimensionClosed : M.embeddingDimension
  meanCurvatureDefinedClosed : M.meanCurvatureDefined
  elasticEnergyFunctionalClosed : M.elasticEnergyFunctional
  spontaneousCurvatureParamClosed : M.spontaneousCurvatureParam

def MembraneShapeClosed (M : MembraneShapePackage) : Prop :=
  M.surfaceType ∧ M.embeddingDimension ∧ M.meanCurvatureDefined ∧ M.elasticEnergyFunctional ∧ M.spontaneousCurvatureParam

theorem membrane_shape_closed_from_evidence (M : MembraneShapePackage) (E : MembraneShapeEvidence M) : MembraneShapeClosed M := by
  exact And.intro E.surfaceTypeClosed
    (And.intro E.embeddingDimensionClosed
      (And.intro E.meanCurvatureDefinedClosed
        (And.intro E.elasticEnergyFunctionalClosed E.spontaneousCurvatureParamClosed)))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse