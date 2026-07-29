import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.PenetrationTheory

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure MassTransferAnalyticFoundation where
  pde : MassTransferPDEPackage
  pdeEvidence : MassTransferPDEEvidence pde
  coefficients : MassTransferCoefficientsPackage pde
  coefficientsEvidence : MassTransferCoefficientsEvidence coefficients
  twoFilm : TwoFilmTheoryPackage pde coefficients
  twoFilmEvidence : TwoFilmTheoryEvidence twoFilm
  penetration : PenetrationTheoryPackage pde coefficients twoFilm
  penetrationEvidence : PenetrationTheoryEvidence penetration

def MassTransferAnalyticFoundationClosed (A : MassTransferAnalyticFoundation) : Prop :=
  MassTransferPDEClosed A.pde ∧
  MassTransferCoefficientsClosed A.coefficients ∧
  TwoFilmTheoryClosed A.twoFilm ∧
  PenetrationTheoryClosed A.penetration

theorem mass_transfer_analytic_foundation_closed_from_evidence
    (A : MassTransferAnalyticFoundation) : MassTransferAnalyticFoundationClosed A := by
  exact And.intro (mass_transfer_pde_closed_from_evidence A.pde A.pdeEvidence)
    (And.intro (mass_transfer_coefficients_closed_from_evidence A.coefficients A.coefficientsEvidence)
      (And.intro (two_film_theory_closed_from_evidence A.twoFilm A.twoFilmEvidence)
        (penetration_theory_closed_from_evidence A.penetration A.penetrationEvidence)))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse