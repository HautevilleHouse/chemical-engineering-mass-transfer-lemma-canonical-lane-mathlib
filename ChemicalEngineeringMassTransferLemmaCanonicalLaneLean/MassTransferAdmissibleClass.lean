import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure ChemicalAdmittedObject where
  system : Type
  phaseBoundary : Type
  concentrationField : system → PhaseBoundary → ℝ
  fluxLaw : Prop
  equilibriumCondition : Prop
  conclusion : fluxLaw ∧ equilibriumCondition

structure MassTransferAdmissibleClass where
  object : ChemicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : MassTransferAdmissibleClass) : Prop :=
  let O := A.object
  O.fluxLaw ∧ O.equilibriumCondition ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
