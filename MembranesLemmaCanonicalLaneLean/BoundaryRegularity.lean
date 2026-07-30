import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure BoundaryRegularityPackage where
  traceTheorem : Prop
  liftingTheorem : Prop
  compactEmbedding : Prop

structure BoundaryRegularityEvidence (B : BoundaryRegularityPackage) where
  traceTheoremClosed : B.traceTheorem
  liftingTheoremClosed : B.liftingTheorem
  compactEmbeddingClosed : B.compactEmbedding

def BoundaryRegularityClosed (B : BoundaryRegularityPackage) : Prop :=
  B.traceTheorem ∧ B.liftingTheorem ∧ B.compactEmbedding

theorem boundary_regularity_closed_from_evidence (B : BoundaryRegularityPackage)
    (Ev : BoundaryRegularityEvidence B) : BoundaryRegularityClosed B := by
  exact And.intro Ev.traceTheoremClosed (And.intro Ev.liftingTheoremClosed Ev.compactEmbeddingClosed)

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse
