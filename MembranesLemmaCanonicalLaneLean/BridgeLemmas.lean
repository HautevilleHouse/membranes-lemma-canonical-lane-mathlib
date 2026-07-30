import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MembranesWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MembranesLemmaCanonicalLaneLean
end HautevilleHouse