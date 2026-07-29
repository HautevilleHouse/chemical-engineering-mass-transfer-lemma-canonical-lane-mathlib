import chemicalEngineeringMassTransferLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.massTransferEquation

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.massTransferEquation

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse