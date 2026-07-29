import ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.MassTransferAdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure FilmTheoryLayer where
  filmThickness : ℝ
  diffusionCoefficient : ℝ
  concentrationGradient : ℝ → ℝ
  massFlux : ℝ
  filmModelClosed : Prop

def bridgeClosed (A : MassTransferAdmissibleClass) : Prop :=
  A.object.fluxLaw

theorem bridge_from_admissible_class (A : MassTransferAdmissibleClass) : bridgeClosed A :=
  A.object.conclusion.left

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
