import ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.FilmTheoryPackage

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure MassBalancePackage {O : ChemicalEngineeringAdmittedObject}
    (F : FilmTheoryPackage O) where
  bulkPhaseBalance : Prop
  filmPhaseBalance : Prop
  interfaceContinuity : Prop
  overallMassBalance : Prop
  bulkPhaseBalanceTerm : bulkPhaseBalance
  filmPhaseBalanceTerm : filmPhaseBalance
  interfaceContinuityTerm : interfaceContinuity
  overallMassBalanceTerm : overallMassBalance

structure MassBalanceEvidence {O : ChemicalEngineeringAdmittedObject}
    {F : FilmTheoryPackage O} (M : MassBalancePackage F) where
  bulkPhaseBalanceClosed : M.bulkPhaseBalance
  filmPhaseBalanceClosed : M.filmPhaseBalance
  interfaceContinuityClosed : M.interfaceContinuity
  overallMassBalanceClosed : M.overallMassBalance

def MassBalanceClosed {O : ChemicalEngineeringAdmittedObject}
    {F : FilmTheoryPackage O} (M : MassBalancePackage F) : Prop :=
  M.bulkPhaseBalance ∧ M.filmPhaseBalance ∧ M.interfaceContinuity ∧ M.overallMassBalance

theorem mass_balance_closed_from_evidence {O : ChemicalEngineeringAdmittedObject}
    {F : FilmTheoryPackage O} (M : MassBalancePackage F) (E : MassBalanceEvidence M) :
    MassBalanceClosed M := by
  exact And.intro E.bulkPhaseBalanceClosed
    (And.intro E.filmPhaseBalanceClosed
      (And.intro E.interfaceContinuityClosed E.overallMassBalanceClosed))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse