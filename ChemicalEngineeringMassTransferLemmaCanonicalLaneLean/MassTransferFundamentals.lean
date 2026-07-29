import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure MassTransferPackage where
  concentrationField : Type u
  diffusionCoefficient : Type v
  convectiveVelocity : Type w
  sourceTerm : Type x
  massTransferEquation : Prop
  boundaryConditions : Prop
  initialCondition : Prop
  wellPosedness : Prop

structure MassTransferEvidence (M : MassTransferPackage) where
  massTransferEquationClosed : M.massTransferEquation
  boundaryConditionsClosed : M.boundaryConditions
  initialConditionClosed : M.initialCondition
  wellPosednessClosed : M.wellPosedness

def MassTransferClosed (M : MassTransferPackage) : Prop :=
  M.massTransferEquation ∧ M.boundaryConditions ∧ M.initialCondition ∧ M.wellPosedness

theorem mass_transfer_closed_from_evidence (M : MassTransferPackage) (E : MassTransferEvidence M) :
    MassTransferClosed M := by
  exact And.intro E.massTransferEquationClosed
    (And.intro E.boundaryConditionsClosed
      (And.intro E.initialConditionClosed E.wellPosednessClosed))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse