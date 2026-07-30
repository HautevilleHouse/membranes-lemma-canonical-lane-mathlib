import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure FiniteElementApproximationPackage where
  conformingMethod : Prop
  errorEstimate : Prop
  convergenceRate : Prop

structure FiniteElementApproximationEvidence (F : FiniteElementApproximationPackage) where
  conformingMethodClosed : F.conformingMethod
  errorEstimateClosed : F.errorEstimate
  convergenceRateClosed : F.convergenceRate

def FiniteElementApproximationClosed (F : FiniteElementApproximationPackage) : Prop :=
  F.conformingMethod ∧ F.errorEstimate ∧ F.convergenceRate

theorem finite_element_approximation_closed_from_evidence
    (F : FiniteElementApproximationPackage)
    (Ev : FiniteElementApproximationEvidence F) : FiniteElementApproximationClosed F := by
  exact And.intro Ev.conformingMethodClosed (And.intro Ev.errorEstimateClosed Ev.convergenceRateClosed)

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse
