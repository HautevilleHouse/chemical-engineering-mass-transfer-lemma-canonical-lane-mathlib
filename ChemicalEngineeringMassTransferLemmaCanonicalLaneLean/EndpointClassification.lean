import chemicalEngineeringMassTransferLemmaCanonicalLaneLean.MassTransferCoefficients

/-!
# Endpoint Classification Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure EndpointClassificationPackage {A : AdmissibleClass}
    {F : MassTransferPDEPackage A} {C : MassTransferCoefficientsPackage F} where
  finalConcentrationProfile : Type u
  steadyStateReached : Prop
  massTransferRateMatch : Prop
  endpointMatchesEngineeringStatement : Prop

structure EndpointClassificationEvidence {A : AdmissibleClass}
    {F : MassTransferPDEPackage A} {C : MassTransferCoefficientsPackage F}
    (Epkg : EndpointClassificationPackage C) where
  steadyStateReachedClosed : Epkg.steadyStateReached
  massTransferRateMatchClosed : Epkg.massTransferRateMatch
  endpointMatchesEngineeringStatementClosed : Epkg.endpointMatchesEngineeringStatement

def EndpointClassificationClosed {A : AdmissibleClass}
    {F : MassTransferPDEPackage A} {C : MassTransferCoefficientsPackage F}
    (Epkg : EndpointClassificationPackage C) : Prop :=
  Epkg.steadyStateReached ∧ Epkg.massTransferRateMatch ∧ Epkg.endpointMatchesEngineeringStatement

theorem endpoint_classification_closed_from_evidence
    {A : AdmissibleClass} {F : MassTransferPDEPackage A}
    {C : MassTransferCoefficientsPackage F} (Epkg : EndpointClassificationPackage C)
    (E : EndpointClassificationEvidence Epkg) : EndpointClassificationClosed Epkg := by
  exact And.intro E.steadyStateReachedClosed
    (And.intro E.massTransferRateMatchClosed E.endpointMatchesEngineeringStatementClosed)

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse