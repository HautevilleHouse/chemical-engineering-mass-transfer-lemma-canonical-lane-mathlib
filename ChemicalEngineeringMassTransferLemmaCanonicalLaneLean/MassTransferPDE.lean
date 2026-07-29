import canonicalLaneMathlib.AdmissibleClass

/-!
# Mass Transfer PDE Package

This module records the mass-transfer partial differential equation over a chemical
engineering domain. The analytic content is expressed as explicit proof obligations
carried by the package.
-/

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure MassTransferPDEPackage where
  spatialDomain : Type u
  timeDomain : Type v
  concentrationField : spatialDomain -> timeDomain -> Type w
  diffusiveFlux : Type x
  convectiveFlux : Type y
  reactionTerm : Type z
  massBalanceEquation : Prop
  ficksFirstLaw : Prop
  ficksSecondLaw : Prop
  boundaryConditions : Prop
  initialCondition : Prop
  smoothSolutions : Prop

structure MassTransferPDEEvidence (F : MassTransferPDEPackage) where
  massBalanceEquationClosed : F.massBalanceEquation
  ficksFirstLawClosed : F.ficksFirstLaw
  ficksSecondLawClosed : F.ficksSecondLaw
  boundaryConditionsClosed : F.boundaryConditions
  initialConditionClosed : F.initialCondition
  smoothSolutionsClosed : F.smoothSolutions

def MassTransferPDEClosed (F : MassTransferPDEPackage) : Prop :=
  F.massBalanceEquation ∧
  F.ficksFirstLaw ∧
  F.ficksSecondLaw ∧
  F.boundaryConditions ∧
  F.initialCondition ∧
  F.smoothSolutions

theorem mass_transfer_pde_closed_from_evidence (F : MassTransferPDEPackage)
    (E : MassTransferPDEEvidence F) : MassTransferPDEClosed F := by
  exact And.intro E.massBalanceEquationClosed
    (And.intro E.ficksFirstLawClosed
      (And.intro E.ficksSecondLawClosed
        (And.intro E.boundaryConditionsClosed
          (And.intro E.initialConditionClosed
            E.smoothSolutionsClosed))))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse