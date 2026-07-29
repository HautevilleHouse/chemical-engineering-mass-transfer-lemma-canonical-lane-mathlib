import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.FilmTheory

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure TwoFilmResistancePackage {M : MassTransferPackage}
    {F1 F2 : FilmTheoryPackage M} where
  gasFilm : F1
  liquidFilm : F2
  interfaceEquilibrium : Prop
  overallMassTransferCoefficient : Prop

structure TwoFilmResistanceEvidence {M : MassTransferPackage}
    {F1 F2 : FilmTheoryPackage M} (T : TwoFilmResistancePackage M F1 F2) where
  gasFilmClosed : FilmTheoryClosed T.gasFilm
  liquidFilmClosed : FilmTheoryClosed T.liquidFilm
  interfaceEquilibriumClosed : T.interfaceEquilibrium
  overallMassTransferCoefficientClosed : T.overallMassTransferCoefficient

def TwoFilmResistanceClosed {M : MassTransferPackage}
    {F1 F2 : FilmTheoryPackage M} (T : TwoFilmResistancePackage M F1 F2) : Prop :=
  FilmTheoryClosed T.gasFilm ∧ FilmTheoryClosed T.liquidFilm ∧
  T.interfaceEquilibrium ∧ T.overallMassTransferCoefficient

theorem two_film_resistance_closed_from_evidence
    {M : MassTransferPackage} {F1 F2 : FilmTheoryPackage M}
    (T : TwoFilmResistancePackage M F1 F2) (E : TwoFilmResistanceEvidence T) :
    TwoFilmResistanceClosed T := by
  exact And.intro E.gasFilmClosed
    (And.intro E.liquidFilmClosed
      (And.intro E.interfaceEquilibriumClosed E.overallMassTransferCoefficientClosed))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse