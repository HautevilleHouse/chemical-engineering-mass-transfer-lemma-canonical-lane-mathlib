import canonicalLaneMathlib.AdmissibleClass

/-!
# Mass Transfer Coefficients Package

This module defines the mass transfer coefficient correlations and their
admissibility closure conditions.
-/

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferLemmaCanonicalLaneLean

structure MassTransferCoefficientPackage where
  filmModelCoefficient : Prop
  penetrationModelCoefficient : Prop
  surfaceRenewalCoefficient : Prop
  correlationData : Prop
  reynoldsAnalogy : Prop
  chiltonColburnAnalogy : Prop
  coefficientBounds : Prop

structure MassTransferCoefficientEvidence (C : MassTransferCoefficientPackage) where
  filmModelCoefficientClosed : C.filmModelCoefficient
  penetrationModelCoefficientClosed : C.penetrationModelCoefficient
  surfaceRenewalCoefficientClosed : C.surfaceRenewalCoefficient
  correlationDataClosed : C.correlationData
  reynoldsAnalogyClosed : C.reynoldsAnalogy
  chiltonColburnAnalogyClosed : C.chiltonColburnAnalogy
  coefficientBoundsClosed : C.coefficientBounds

def MassTransferCoefficientClosed (C : MassTransferCoefficientPackage) : Prop :=
  C.filmModelCoefficient ∧
  C.penetrationModelCoefficient ∧
  C.surfaceRenewalCoefficient ∧
  C.correlationData ∧
  C.reynoldsAnalogy ∧
  C.chiltonColburnAnalogy ∧
  C.coefficientBounds

theorem mass_transfer_coefficient_closed_from_evidence
    (C : MassTransferCoefficientPackage)
    (E : MassTransferCoefficientEvidence C) : MassTransferCoefficientClosed C := by
  exact And.intro E.filmModelCoefficientClosed
    (And.intro E.penetrationModelCoefficientClosed
      (And.intro E.surfaceRenewalCoefficientClosed
        (And.intro E.correlationDataClosed
          (And.intro E.reynoldsAnalogyClosed
            (And.intro E.chiltonColburnAnalogyClosed
              E.coefficientBoundsClosed)))))

end ChemicalEngineeringMassTransferLemmaCanonicalLaneLean
end HautevilleHouse