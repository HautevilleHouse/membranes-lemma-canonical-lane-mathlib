import MembranesLemmaCanonicalLaneLean.MembraneShapePackage

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembranePDEPackage (M : MembraneShapePackage) where
  shapeEquation : Prop
  boundaryConditions : Prop
  energyMinimization : Prop
  regularityResult : Prop

structure MembranePDEEvidence {M : MembraneShapePackage} (P : MembranePDEPackage M) where
  shapeEquationClosed : P.shapeEquation
  boundaryConditionsClosed : P.boundaryConditions
  energyMinimizationClosed : P.energyMinimization
  regularityResultClosed : P.regularityResult

def MembranePDEClosed {M : MembraneShapePackage} (P : MembranePDEPackage M) : Prop :=
  P.shapeEquation ∧ P.boundaryConditions ∧ P.energyMinimization ∧ P.regularityResult

theorem membrane_pde_closed_from_evidence {M : MembraneShapePackage} (P : MembranePDEPackage M) (E : MembranePDEEvidence P) : MembranePDEClosed P := by
  exact And.intro E.shapeEquationClosed
    (And.intro E.boundaryConditionsClosed
      (And.intro E.energyMinimizationClosed E.regularityResultClosed))

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse