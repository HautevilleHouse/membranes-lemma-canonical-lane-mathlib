import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

structure MembraneSurfacePackage where
  carrier : Type u
  embedding : Type v
  inducedMetric : Type w
  secondFundamentalForm : Type x
  smoothImmersion : Prop
  metricFromEmbedding : Prop

structure MembraneTopologyEvidence (M : MembraneSurfacePackage) where
  smoothImmersionClosed : M.smoothImmersion
  metricFromEmbeddingClosed : M.metricFromEmbedding

def MembraneTopologyClosed (M : MembraneSurfacePackage) : Prop :=
  M.smoothImmersion ∧ M.metricFromEmbedding

theorem membrane_topology_closed_from_evidence (M : MembraneSurfacePackage)
    (E : MembraneTopologyEvidence M) : MembraneTopologyClosed M := by
  exact And.intro E.smoothImmersionClosed E.metricFromEmbeddingClosed

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse