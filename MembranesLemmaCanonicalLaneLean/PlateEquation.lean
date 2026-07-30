import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure PlateEquationPackage (E : ElasticEnergyPackage) where
  pdeOperator : Type u
  existence : Prop
  uniqueness : Prop
  regularity : Prop

structure PlateEquationEvidence (E : ElasticEnergyPackage)
    (P : PlateEquationPackage E) where
  existenceClosed : P.existence
  uniquenessClosed : P.uniqueness
  regularityClosed : P.regularity

def PlateEquationClosed (E : ElasticEnergyPackage) (P : PlateEquationPackage E) : Prop :=
  P.existence ∧ P.uniqueness ∧ P.regularity

theorem plate_equation_closed_from_evidence (E : ElasticEnergyPackage)
    (P : PlateEquationPackage E) (Ev : PlateEquationEvidence E P) :
    PlateEquationClosed E P := by
  exact And.intro Ev.existenceClosed (And.intro Ev.uniquenessClosed Ev.regularityClosed)

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse
