import ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.MassTransferCorrelations

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure MaxwellStefanPackage where
  componentCount : ℕ
  binaryDiffusivities : Matrix (Fin componentCount) (Fin componentCount) ℝ
  moleFractionGradients : (Fin componentCount) → ℝ
  molarFluxes : (Fin componentCount) → ℝ
  constitutiveEquation : Prop
  inversionCondition : Prop

structure MaxwellStefanEvidence (M : MaxwellStefanPackage) where
  constitutiveEquationClosed : M.constitutiveEquation
  inversionConditionClosed : M.inversionCondition

def MaxwellStefanClosed (M : MaxwellStefanPackage) : Prop :=
  M.constitutiveEquation ∧ M.inversionCondition

theorem maxwell_stefan_closed_from_evidence (M : MaxwellStefanPackage) (E : MaxwellStefanEvidence M) :
    MaxwellStefanClosed M := by
  exact And.intro E.constitutiveEquationClosed E.inversionConditionClosed

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
