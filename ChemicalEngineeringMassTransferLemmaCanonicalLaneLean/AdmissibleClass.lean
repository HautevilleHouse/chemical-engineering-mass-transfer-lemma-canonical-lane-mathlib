import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure ChemicalMassTransferObject where
  species : Type u
  concentrationField : Type v
  diffusiveFlux : Type w
  massTransferEquation : Prop

structure AdmissibleClass where
  object : ChemicalMassTransferObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse