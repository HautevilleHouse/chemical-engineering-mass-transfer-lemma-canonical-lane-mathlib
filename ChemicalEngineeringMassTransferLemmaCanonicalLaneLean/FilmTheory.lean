import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.MassTransferFundamentals

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure FilmTheoryPackage {M : MassTransferPackage} where
  filmThickness : ℝ
  interfaceConcentration : Prop
  bulkConcentration : Prop
  fluxExpression : Prop

structure FilmTheoryEvidence {M : MassTransferPackage}
    (F : FilmTheoryPackage M) where
  filmThicknessPositive : F.filmThickness > 0
  interfaceConcentrationClosed : F.interfaceConcentration
  bulkConcentrationClosed : F.bulkConcentration
  fluxExpressionClosed : F.fluxExpression

def FilmTheoryClosed {M : MassTransferPackage} (F : FilmTheoryPackage M) : Prop :=
  (F.filmThickness > 0) ∧ F.interfaceConcentration ∧ F.bulkConcentration ∧ F.fluxExpression

theorem film_theory_closed_from_evidence {M : MassTransferPackage}
    (F : FilmTheoryPackage M) (E : FilmTheoryEvidence F) : FilmTheoryClosed F := by
  exact And.intro E.filmThicknessPositive
    (And.intro E.interfaceConcentrationClosed
      (And.intro E.bulkConcentrationClosed E.fluxExpressionClosed))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse