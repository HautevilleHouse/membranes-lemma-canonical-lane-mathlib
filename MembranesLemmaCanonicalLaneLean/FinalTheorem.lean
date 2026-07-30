import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

def ConstrainedMembranesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_membranes_endgame (A : AdmissibleClass) :
    ConstrainedMembranesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse