import ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.SurfaceRenewalTheory

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure DimensionlessCorrelation where
  sherwoodNumber : ℝ → ℝ
  reynoldsNumber : ℝ
  schmidtNumber : ℝ
  correlationFunction : ℝ → ℝ → ℝ → ℝ
  empiricalFit : Prop

structure CorrelationEvidence (C : DimensionlessCorrelation) where
  sherwoodNumberClosed : C.sherwoodNumber = C.correlationFunction C.reynoldsNumber C.schmidtNumber
  empiricalFitClosed : C.empiricalFit

def CorrelationClosed (C : DimensionlessCorrelation) : Prop :=
  C.sherwoodNumber = C.correlationFunction C.reynoldsNumber C.schmidtNumber ∧ C.empiricalFit

theorem correlation_closed_from_evidence (C : DimensionlessCorrelation) (E : CorrelationEvidence C) :
    CorrelationClosed C := by
  exact And.intro E.sherwoodNumberClosed E.empiricalFitClosed

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
