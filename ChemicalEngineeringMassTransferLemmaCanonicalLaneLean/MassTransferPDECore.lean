import chemicalEngineeringMassTransferLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Mass Transfer PDE Core Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure MassTransferPDEPackage (A : AdmissibleClass) where
  diffusionEquation : Prop
  convectiveTerm : Prop
  reactionTerm : Prop
  boundaryConditions : Prop
  initialCondition : Prop

structure MassTransferPDEEvidence {A : AdmissibleClass} (F : MassTransferPDEPackage A) where
  diffusionEquationClosed : F.diffusionEquation
  convectiveTermClosed : F.convectiveTerm
  reactionTermClosed : F.reactionTerm
  boundaryConditionsClosed : F.boundaryConditions
  initialConditionClosed : F.initialCondition

def MassTransferPDEClosed {A : AdmissibleClass} (F : MassTransferPDEPackage A) : Prop :=
  F.diffusionEquation ∧ F.convectiveTerm ∧ F.reactionTerm ∧ F.boundaryConditions ∧ F.initialCondition

theorem mass_transfer_pde_closed_from_evidence
    {A : AdmissibleClass} (F : MassTransferPDEPackage A) (E : MassTransferPDEEvidence F) :
    MassTransferPDEClosed F := by
  exact And.intro E.diffusionEquationClosed
    (And.intro E.convectiveTermClosed
      (And.intro E.reactionTermClosed
        (And.intro E.boundaryConditionsClosed E.initialConditionClosed)))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse