import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure ElasticEnergyPackage where
  energyFunctional : Type u
  positivity : Prop
  coercivity : Prop
  lowerBound : Prop

structure ElasticEnergyEvidence (E : ElasticEnergyPackage) where
  positivityClosed : E.positivity
  coercivityClosed : E.coercivity
  lowerBoundClosed : E.lowerBound

def ElasticEnergyClosed (E : ElasticEnergyPackage) : Prop :=
  E.positivity ∧ E.coercivity ∧ E.lowerBound

theorem elastic_energy_closed_from_evidence (E : ElasticEnergyPackage)
    (Ev : ElasticEnergyEvidence E) : ElasticEnergyClosed E := by
  exact And.intro Ev.positivityClosed (And.intro Ev.coercivityClosed Ev.lowerBoundClosed)

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse
