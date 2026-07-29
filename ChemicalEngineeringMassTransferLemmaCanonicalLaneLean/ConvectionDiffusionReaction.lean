import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.MassTransferFundamentals

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure ConvectionDiffusionReactionPackage {M : MassTransferPackage} where
  convectiveTermControlled : Prop
  diffusiveTermControlled : Prop
  reactionKinetics : Prop
  couplingConsistent : Prop

structure ConvectionDiffusionReactionEvidence {M : MassTransferPackage}
    (C : ConvectionDiffusionReactionPackage M) where
  convectiveTermControlledClosed : C.convectiveTermControlled
  diffusiveTermControlledClosed : C.diffusiveTermControlled
  reactionKineticsClosed : C.reactionKinetics
  couplingConsistentClosed : C.couplingConsistent

def ConvectionDiffusionReactionClosed {M : MassTransferPackage}
    (C : ConvectionDiffusionReactionPackage M) : Prop :=
  C.convectiveTermControlled ∧ C.diffusiveTermControlled ∧
  C.reactionKinetics ∧ C.couplingConsistent

theorem convection_diffusion_reaction_closed_from_evidence
    {M : MassTransferPackage} (C : ConvectionDiffusionReactionPackage M)
    (E : ConvectionDiffusionReactionEvidence C) : ConvectionDiffusionReactionClosed C := by
  exact And.intro E.convectiveTermControlledClosed
    (And.intro E.diffusiveTermControlledClosed
      (And.intro E.reactionKineticsClosed E.couplingConsistentClosed))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse