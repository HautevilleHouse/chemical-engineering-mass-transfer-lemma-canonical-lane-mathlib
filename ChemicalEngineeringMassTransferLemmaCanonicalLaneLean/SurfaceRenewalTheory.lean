import ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.PenetrationTheory

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure SurfaceRenewalPackage where
  renewalRate : ℝ
  averageContactTime : ℝ
  massTransferCoefficientModel : ℝ → ℝ
  renewalModelClosed : Prop

structure SurfaceRenewalEvidence (S : SurfaceRenewalPackage) where
  averageContactTimeClosed : S.averageContactTime = 1 / S.renewalRate
  renewalModelClosedClosed : S.renewalModelClosed

def SurfaceRenewalClosed (S : SurfaceRenewalPackage) : Prop :=
  S.averageContactTime = 1 / S.renewalRate ∧ S.renewalModelClosed

theorem surface_renewal_closed_from_evidence (S : SurfaceRenewalPackage) (E : SurfaceRenewalEvidence S) :
    SurfaceRenewalClosed S := by
  exact And.intro E.averageContactTimeClosed E.renewalModelClosedClosed

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
