import ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.MassBalancePackage

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure TwoFilmInterfacePackage {O : ChemicalEngineeringAdmittedObject}
    {F : FilmTheoryPackage O} {M : MassBalancePackage F} where
  interfaceEquilibrium : Prop
  film1Resistance : Prop
  film2Resistance : Prop
  overallMassTransferCoefficientDerived : Prop
  interfaceEquilibriumTerm : interfaceEquilibrium
  film1ResistanceTerm : film1Resistance
  film2ResistanceTerm : film2Resistance
  overallMassTransferCoefficientDerivedTerm : overallMassTransferCoefficientDerived

structure TwoFilmInterfaceEvidence {O : ChemicalEngineeringAdmittedObject}
    {F : FilmTheoryPackage O} {M : MassBalancePackage F}
    (T : TwoFilmInterfacePackage M) where
  interfaceEquilibriumClosed : T.interfaceEquilibrium
  film1ResistanceClosed : T.film1Resistance
  film2ResistanceClosed : T.film2Resistance
  overallMassTransferCoefficientDerivedClosed : T.overallMassTransferCoefficientDerived

def TwoFilmInterfaceClosed {O : ChemicalEngineeringAdmittedObject}
    {F : FilmTheoryPackage O} {M : MassBalancePackage F}
    (T : TwoFilmInterfacePackage M) : Prop :=
  T.interfaceEquilibrium ∧ T.film1Resistance ∧ T.film2Resistance ∧ T.overallMassTransferCoefficientDerived

theorem two_film_interface_closed_from_evidence {O : ChemicalEngineeringAdmittedObject}
    {F : FilmTheoryPackage O} {M : MassBalancePackage F}
    (T : TwoFilmInterfacePackage M) (E : TwoFilmInterfaceEvidence T) :
    TwoFilmInterfaceClosed T := by
  exact And.intro E.interfaceEquilibriumClosed
    (And.intro E.film1ResistanceClosed
      (And.intro E.film2ResistanceClosed E.overallMassTransferCoefficientDerivedClosed))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse