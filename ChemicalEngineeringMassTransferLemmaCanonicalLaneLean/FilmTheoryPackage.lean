import ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.MassTransferAdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure FilmTheoryPackage (O : ChemicalEngineeringAdmittedObject) where
  filmThicknessDefined : Prop
  concentrationProfile : O.species → ℝ → ℝ
  steadyStateDiffusionEquation : Prop
  boundaryConditions : O.interfaceConcentration ≠ O.bulkConcentration → Prop
  fluxExpression : Prop
  filmThicknessDefinedTerm : filmThicknessDefined
  steadyStateDiffusionEquationTerm : steadyStateDiffusionEquation
  boundaryConditionsTerm : boundaryConditions (by
    intro h
    exact h)
  fluxExpressionTerm : fluxExpression

structure FilmTheoryEvidence {O : ChemicalEngineeringAdmittedObject} (F : FilmTheoryPackage O) where
  filmThicknessDefinedClosed : F.filmThicknessDefined
  steadyStateDiffusionEquationClosed : F.steadyStateDiffusionEquation
  boundaryConditionsClosed : F.boundaryConditions (by
    intro h
    exact h)
  fluxExpressionClosed : F.fluxExpression

def FilmTheoryClosed {O : ChemicalEngineeringAdmittedObject} (F : FilmTheoryPackage O) : Prop :=
  F.filmThicknessDefined ∧ F.steadyStateDiffusionEquation ∧
  (F.interfaceConcentration ≠ F.bulkConcentration → F.boundaryConditions (by
    intro h; exact h)) ∧ F.fluxExpression

theorem film_theory_closed_from_evidence {O : ChemicalEngineeringAdmittedObject}
    (F : FilmTheoryPackage O) (E : FilmTheoryEvidence F) : FilmTheoryClosed F := by
  refine And.intro E.filmThicknessDefinedClosed
    (And.intro E.steadyStateDiffusionEquationClosed
      (And.intro (fun h => ?_) E.fluxExpressionClosed))
  exact E.boundaryConditionsClosed h

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse