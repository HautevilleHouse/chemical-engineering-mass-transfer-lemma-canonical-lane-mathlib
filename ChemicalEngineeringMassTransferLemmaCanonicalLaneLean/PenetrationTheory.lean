import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMassTransferLemmaCanonicalLaneLean.MassTransferFundamentals

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure PenetrationTheoryPackage {M : MassTransferPackage} where
  contactTime : ℝ
  penetrationDepth : ℝ
  transientDiffusion : Prop
  averageFlux : Prop

structure PenetrationTheoryEvidence {M : MassTransferPackage}
    (P : PenetrationTheoryPackage M) where
  contactTimePositive : P.contactTime > 0
  penetrationDepthFinite : P.penetrationDepth > 0
  transientDiffusionClosed : P.transientDiffusion
  averageFluxClosed : P.averageFlux

def PenetrationTheoryClosed {M : MassTransferPackage} (P : PenetrationTheoryPackage M) : Prop :=
  (P.contactTime > 0) ∧ (P.penetrationDepth > 0) ∧ P.transientDiffusion ∧ P.averageFlux

theorem penetration_theory_closed_from_evidence {M : MassTransferPackage}
    (P : PenetrationTheoryPackage M) (E : PenetrationTheoryEvidence P) : PenetrationTheoryClosed P := by
  exact And.intro E.contactTimePositive
    (And.intro E.penetrationDepthFinite
      (And.intro E.transientDiffusionClosed E.averageFluxClosed))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse